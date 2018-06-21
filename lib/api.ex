defmodule API do
  # TODO: make functions that need to be private, private

  def base_path(subdomain \\ Application.get_env(:decipher_api, :subdomain)) do
    "http://#{subdomain}.decipherinc.com/api/v1/"
  end

  def api_headers(api_key \\ Application.get_env(:decipher_api, :api_key)) do
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
      :error ->
        {:error, :json_parse_failed}
    end
  end

  def get(endpoint) do
    HTTPoison.get!(base_path() <> endpoint, api_headers())
    |> parse_response()
  end

  def post(body, endpoint) do
    HTTPoison.post!(base_path() <> endpoint, body, api_headers())
  end

  def get_question_metadata(survey_id) do
    get("surveys/#{survey_id}/datamap?format=json")
  end

  # You need to pass in a single survey like `selfserve/540/180435`
  # or multiple as comma seperated `selfserve/540/180435,selfserve/540/170456`
  # iex> API.get_survey_results("all", "selfserve/540/180435")
  @spec get_survey_results(String.t, String.t) :: String.t
  def get_survey_results(scope, survey_id) do
    get("datafeed/#{scope}?paths=#{survey_id}")
  end

  @spec parse_response(String.t) :: %{} | {:error, String.t}
  def parse_response(response) do
    case response.status_code do
      200 ->
        response.body
        |> decode_json()
      401 ->
        {:error, "#{response.status_code}: invalid authentication; your API key is invalid, expired or not valid from this IP or action"}
      402 ->
        {:error, "#{response.status_code}: payment required: you have exceeded your monthly API calls"}
      403 ->
        {:error, "#{response.status_code}: invalid authorization: your API key is valid but you are not allowed access to this survey"}
      404 ->
        {:error, "#{response.status_code}: not found: you asked for a survey or other resource that does not exist"}
      405 ->
        {:error, "#{response.status_code}: method not allowed: you tried to e.g. DELETE something that does not support deletion"}
      429 ->
        {:error, "#{response.status_code}: too many concurrent requests"}
      400 ->
        {:error, "#{response.status_code}: other invalid parameter not covered above, e.g. survey cannot be loaded due to an error"}
      501 ->
        {:error, "#{response.status_code}: Method not implemented in API. Resources does not implement this method. Are you using GET/POST/PUT/DELETE?"}
      _ ->
        {:error, "API returned an undocumented HTTP status code of: #{response.status_code}"}
    end
  end

  def advance_datafeed(ack_code, scope \\ "all") do
    # TODO: Handle errror
    {:ok, body} =
      %{"ack" => ack_code}
      |> encode_json()

    post(body, "datafeed/#{scope}/ack")
  end

  def reset_datafeed(survey_id, scope \\ "all") do
    HTTPoison.delete!(base_path() <> "datafeed/#{scope}?paths=#{survey_id}", api_headers())
  end
end
