defmodule DecipherAPITest.Support.InMemoryHTTPClient do
  alias DecipherAPITest.Support.FakeData

  def start do
    Agent.start_link(&Map.new/0, name: __MODULE__)
  end

  def queue_response(verb, endpoint, response) do
    Agent.update(__MODULE__, fn(queue) ->
      Map.update(queue, {verb, endpoint}, [response], fn(responses) ->
        responses ++ [response]
      end)
    end)
  end

  def queued_response(verb, endpoint) do
    Agent.get_and_update(__MODULE__,
      fn(queue) ->
        responses = Map.get(queue, {verb, endpoint}, [])
        case responses do
          [response | rest] ->
            {response, Map.put(queue, {verb, endpoint}, rest)}
          [] ->
            {nil, queue}
        end
    end)
  end

  @spec get!(String.t, []) :: %{} | {:error, String.t}
  def get!(endpoint, _headers) do
    cond do
      String.contains?(endpoint, "datafeed") ->
        queued_response(:get, :datafeed) || FakeData.datafeed_complete_true()
      String.contains?(endpoint, "datamap") ->
        queued_response(:get, :datamap) || FakeData.raw_datamap_response()
      String.contains?(endpoint, "survey.xml") ->
        queued_response(:get, :datamap) ||
          %{
            status_code: 200,
            body: FakeData.raw_all_question_xml_response
          }
    end
  end

  def delete!(_endpoint, _api_headers) do
    queued_response(:delete, :datafeed) || FakeData.reset_datafeed_response()
  end

  # only advance datafeed hits this right now
  def post(_, _, _) do
    queued_response(:post, :datafeed) || FakeData.advance_datafeed_response()
  end
  
  def put(endpoint, _, _) do
    if String.contains?(endpoint, "data/edit") do
      queued_response(:put, :edit)
    end
  end
end
