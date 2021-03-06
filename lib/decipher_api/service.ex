defmodule DecipherAPI.Service do
  @moduledoc """
  Provides lower level functions to interact with Decipher's API service.
  """
  alias DecipherAPI.AccountInfo
  @decipher_api Application.get_env(:decipher_api, :service, DecipherAPI.Service.HTTPClient)

  @spec base_path(String.t) :: String.t
  def base_path(domain) do
    "https://#{domain}/api/v1/"
  end

  @spec api_headers(String.t) :: [{String.t, String.t}]
  def api_headers(api_key) do
    [
      {"x-apikey", api_key},
      {"Accept", "application/json, */*"},
      {"Content-Type", "application/json"}
    ]
  end

  @spec encode_json(%{}) :: iodata() | no_return()
  def encode_json(data_structure) do
    data_structure
    |> Poison.encode!()
  end

  @spec decode_json(String.t) :: %{} | {:error, :invalid | {:invalid, binary()}}
  def decode_json(raw_json) do
    with {:ok, data} <- Poison.decode(raw_json) do
      data
    end
  end

  @spec get!(String.t, String.t, String.t) :: {:ok, %{}} | {:error, String.t}
  def get!(endpoint, api_key, domain) when is_binary(endpoint) do
    @decipher_api.get!(base_path(domain) <> endpoint, api_headers(api_key))
    |> parse_response()
  end

  @spec post(String.t, String.t, String.t, String.t) :: {:ok, %{}} | {:error, %{}}
  def post(body, endpoint, api_key, domain) do
    with {:ok, response} <- @decipher_api.post(base_path(domain) <> endpoint, body, api_headers(api_key)) do
      response
      |> parse_response()
    end
  end

  def put(body, endpoint, api_key, domain) do
    with {:ok, response} <- @decipher_api.put(base_path(domain) <> endpoint, body, api_headers(api_key)) do
      response
      |> parse_response()
    end
  end

  @spec get_datamap_metadata(%AccountInfo{}, String.t) :: {:ok, %{}} | {:error, String.t}
  def get_datamap_metadata(
    %AccountInfo{
      survey_url_prefix: survey_url_prefix,
      domain: domain,
      api_key: api_key},
    survey_id
    ) do
    get!("surveys/#{survey_url_prefix}/#{survey_id}/datamap?format=json", api_key, domain)
  end

  @spec get_xml_metadata(%AccountInfo{}, String.t) :: {:ok, String.t} | {:error, String.t}
  def get_xml_metadata(
    %AccountInfo{
      survey_url_prefix: survey_url_prefix,
      domain: domain,
      api_key: api_key
    },
    survey_id) do
    response =
      @decipher_api.get!(
        base_path(domain) <> "surveys/#{survey_url_prefix}/#{survey_id}/files/survey.xml",
        api_headers(api_key)
      )

    case response.status_code do
      200 ->
        {:ok, response.body}
      _ ->
        {:error, "Something went wrong getting the xml doc. Returned status code: #{response.status_code}"}
    end
  end

  @spec get_survey_results(%AccountInfo{}, String.t, String.t) :: {:error, String.t} | {:ok, %{}}
  def get_survey_results(
      %AccountInfo{
        api_key: api_key,
        domain: domain,
        survey_url_prefix: survey_url_prefix
      },
      scope,
      survey_id
  )
      when is_binary(survey_url_prefix)
      and is_binary(scope)
      and is_binary(survey_id) do
    get!(
      "datafeed/#{scope}?paths=#{survey_url_prefix}/#{survey_id}",
      api_key,
      domain
    )
  end

  @spec advance_datafeed(%AccountInfo{}, String.t, String.t) :: {:ok, %{}} | {:error, String.t}
  def advance_datafeed(
    %AccountInfo{
      api_key: api_key,
      domain: domain
    },
    ack_code,
    scope)
      when is_binary(ack_code)
      and is_binary(scope) do

    body = %{"ack" => ack_code} |> encode_json()

    post(body, "datafeed/#{scope}/ack", api_key, domain)
  end

  @spec reset_datafeed(%AccountInfo{}, String.t) :: {:ok, %{}} | {:error, String.t}
  def reset_datafeed(%AccountInfo{domain: domain, api_key: api_key}, scope)
  when is_binary(scope) do
    @decipher_api.delete!(
      base_path(domain) <> "datafeed/#{scope}",
      api_headers(api_key)
    )
    |> parse_response
  end

  @spec parse_response(%HTTPoison.Response{}) :: {:ok, %{}} | {:error, String.t}
  def parse_response(response) do
    case response.status_code do
      200 ->
        {:ok, decode_json(response.body)}
      400 ->
        {:error, "#{response.status_code}: #{response.body}"}
      401 ->
        {:error, "#{response.status_code}: invalid authentication; your API key is invalid, expired or not valid from this IP or action"}
      402 ->
        {:error, "#{response.status_code}: payment required: you have exceeded your monthly API calls"}
      403 ->
        {:error, "#{response.status_code}: invalid authorization: This can mean two things: One, your API key is valid but you are not allowed access to this survey. Two, the API key was valid but a new key has been generated for this account and so this one will no longer work."}
      404 ->
        {:error, "#{response.status_code}: not found: you asked for a survey or other resource that does not exist. Or asked to reset a datafeed that was already reset"}
      405 ->
        {:error, "#{response.status_code}: method not allowed: you tried to e.g. DELETE something that does not support deletion"}
      429 ->
        {:error, "#{response.status_code}: too many concurrent requests"}
      501 ->
        {:error, "#{response.status_code}: Method not implemented in API. Resources does not implement this method. Are you using GET/POST/PUT/DELETE?"}
      _ ->
        {:error, "API returned an undocumented HTTP status code of: #{response.status_code}"}
    end
  end

end
