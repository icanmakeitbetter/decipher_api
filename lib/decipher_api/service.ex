defmodule DecipherAPI.Service do
  @moduledoc """
  Provides lower level functions to interact with Decipher's API service.
  """
  alias DecipherAPI.Datafeed
  alias DecipherAPI.Datafeed.ResultSet
  @decipher_api Application.get_env(:decipher_api, :service, DecipherAPI.Service.HTTPClient)

  def base_path(subdomain \\ Application.fetch_env!(:decipher_api, :subdomain)) do
    "http://#{subdomain}.decipherinc.com/api/v1/"
  end

  def api_headers(api_key \\ Application.fetch_env!(:decipher_api, :api_key)) do
    [
      {"x-apikey", api_key},
      {"Accept", "application/json, */*"},
      {"Content-Type", "application/json"}
    ]
  end

  def encode_json(data_structure) do
    data_structure
    |> Poison.encode()
  end

  def decode_json(raw_json) do
    with {:ok, data} <- Poison.decode(raw_json) do
      data
    else
      {:error, :invalid, _} ->
        {:error, :json_parse_failed}
    end
  end

  @spec get!(String.t) :: %{} | {:error, String.t}
  def get!(endpoint) when is_binary(endpoint) do
    @decipher_api.get!(base_path() <> endpoint, api_headers())
    |> parse_response()
  end

  def post!(body, endpoint) do
    @decipher_api.post!(base_path() <> endpoint, body, api_headers())
    |> parse_response
  end

  @spec get_datamap_metadata(String.t) :: %{} | {:error, String.t}
  def get_datamap_metadata(survey_id) do
    get!("surveys/#{survey_id}/datamap?format=json")
  end

  @spec get_xml_metadata(String.t) :: {:ok, String.t} | {:error, String.t}
  def get_xml_metadata(survey_id) do
    response =
      @decipher_api.get!(
        base_path() <> "surveys/#{survey_id}/files/survey.xml",
        api_headers()
      )

    case response.status_code do
      200 ->
        {:ok, response.body}
      _ ->
        {:error, "Something went wrong getting the xml doc. Returned status code: #{response.status_code}"}
    end
  end

  @doc """
  Get the results of a survey.

    iex> API.get_survey_results("all", "selfserve/540/180435")
  """
  @spec get_survey_results(%Datafeed{}) :: {:error, binary()} | %{}
  def get_survey_results(%Datafeed{survey_id: survey_id, scope: scope})
      when is_binary(scope)
      and is_binary(survey_id) do
    get!("datafeed/#{scope}?paths=#{survey_id}")
  end

  @spec advance_datafeed(%ResultSet{}, %Datafeed{}) :: %{} | {:error, String.t}
  def advance_datafeed(%ResultSet{ack: ack_code}, %Datafeed{scope: scope})
      when is_binary(ack_code)
      and is_binary(scope) do

    {:ok, body} = %{"ack" => ack_code} |> encode_json()

    post!(body, "datafeed/#{scope}/ack")
  end

  @spec reset_datafeed(%Datafeed{}) :: %{} | {:error, String.t}
  def reset_datafeed(%Datafeed{survey_id: survey_id, scope: scope})
      when is_binary(survey_id)
      and is_binary(scope) do
    @decipher_api.delete!(base_path() <> "datafeed/#{scope}?paths=#{survey_id}", api_headers())
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
        {:error, "#{response.status_code}: invalid authorization: your API key is valid but you are not allowed access to this survey"}
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
