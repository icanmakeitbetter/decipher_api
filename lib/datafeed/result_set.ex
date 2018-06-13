defmodule Datafeed.ResultSet do
  alias __MODULE__
  defstruct ack: nil, complete?: false, errors: %{}, results: []

  def new do
    %ResultSet{}
  end

  def build_result_set() do
    new_result_set_struct = new()
    coerce_result_set(new_result_set_struct, new_result_set_struct.complete?)
  end

  def build_result_set(result_set_struct) do
    coerce_result_set(result_set_struct, result_set_struct.complete?)
  end

  def coerce_result_set(result_set_struct, complete_data?) when complete_data? == false do
    result_set = API.get_survey_results()
    coerced_results =
                Enum.map(
                  result_set["results"],
                  fn(result_map) -> Datafeed.Result.coerce_data(result_map)
                end)

    # need to handle merging of errors I think.
    new_result_set = %{
      result_set_struct |
      ack: result_set["ack"],
      complete?: result_set["complete"],
      errors: result_set["errors"],
      results: Enum.into(result_set_struct.results, coerced_results)
    }

    API.advance_datafeed(new_result_set.ack)
    coerce_result_set(new_result_set, new_result_set.complete?)
  end

  def coerce_result_set(result_set, complete_data?) when complete_data? == true do
    result_set
  end
end
