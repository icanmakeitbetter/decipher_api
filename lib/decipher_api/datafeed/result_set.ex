defmodule DecipherAPI.Datafeed.ResultSet do
  alias DecipherAPI.Datamap
  alias __MODULE__
  defstruct(
    ack: nil,
    complete?: false,
    errors: %{},
    results: []
  )

  @spec new(%{}) :: %ResultSet{}
  def new(results) do
    %{
      %ResultSet{} |
      ack: results["ack"],
      complete?: results["complete"],
      errors: results["errors"],
      results: results["results"]
    }
  end

  @spec process_results(%ResultSet{}, %Datamap{} | nil, fun()) :: any
  def process_results(result_set, datamap, fun) do
    case Enum.each(result_set.results,
      fn(result) ->
        result
        |> ResultSet.Result.process_answers(datamap)
        |> fun.(ResultSet.Result.metadata(result))
      end
    ) do
      :ok ->
        result_set
    end
  end

end
