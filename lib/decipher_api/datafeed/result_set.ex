defmodule DecipherAPI.Datafeed.ResultSet do
  alias __MODULE__
  defstruct(
    ack: nil,
    complete?: false,
    errors: %{},
    results: []
  )

  def new(results) do
    %{
      %ResultSet{} |
      ack: results["ack"],
      complete?: results["complete"],
      errors: results["errors"],
      results: results["results"]
    }
  end

  @spec process_results(%ResultSet{}, fun()) :: any
  def process_results(result_set, fun \\ &(&1)) do
    case Enum.each(result_set.results,
      fn(result) ->
        result
        |> ResultSet.Result.coerce_data()
        |> fun.()
      end
    ) do
      :ok ->
        result_set
    end
  end

end
