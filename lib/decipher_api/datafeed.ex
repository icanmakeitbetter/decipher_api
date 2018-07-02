defmodule DecipherAPI.Datafeed do
  @moduledoc """
  How you get your survey results/answers from Decipher.

  Provides functions for interacting with Decipher's datafeed endpoint and
  coercing the results into something more useful.
  """
  alias __MODULE__

  defstruct(
    ack: nil,
    complete?: false,
    errors: %{},
    results: [],
    metadata: %{}
  )

  def new do
    %Datafeed{}
  end

  @doc """
  Get question results for a single survey.

  ## Examples

    iex> DecipherAPI.Datamap.build_result_set("all", "selfserve/555/180435")
  """
  @spec build_result_set(String.t, String.t, %Datafeed{}) :: %Datafeed{}
  def build_result_set(scope, survey_id, result_set_struct \\ new())
      when is_binary(scope)
      and is_binary(survey_id) do
    get_results(scope, survey_id)
    |> coerce_result_set(result_set_struct)
    |> advance()
    |> check_if_more_results(scope, survey_id)
  end

  @spec coerce_result_set(%{}, %Datafeed{}) :: %Datafeed{}
  def coerce_result_set(results, result_set_struct) when is_map(results) do
    coerced_results =
      Enum.map(
        results["results"],
        fn(single_result_map) -> Datafeed.Result.coerce_data(single_result_map)
      end)

    # TODO need to handle merging of errors I think.
    %{
      result_set_struct |
      ack: results["ack"],
      complete?: results["complete"],
      errors: results["errors"],
      results: Enum.into(result_set_struct.results, coerced_results)
    }
  end

  @spec check_if_more_results(%Datafeed{}, String.t, String.t) :: %Datafeed{}
  def check_if_more_results(%Datafeed{complete?: true} = coerced_result_set, _scope, _survey_id) do
    coerced_result_set
  end

  def check_if_more_results(coerced_result_set, scope, survey_id)
      when is_binary(scope)
      and is_binary(survey_id) do
    build_result_set(scope, survey_id, coerced_result_set)
  end


  @spec get_results(String.t, String.t) :: %{}
  def get_results(scope, survey_id)
  when is_binary(scope)
  and is_binary(survey_id) do
    DecipherAPI.Service.get_survey_results(scope, survey_id)
  end

  @doc """
  Once a set of results are retrieved this function is called to acknowledge
  receipt so that the next time you call the datafeed you only get the new
  results.
  """
  @spec advance(%Datafeed{}) :: %Datafeed{}
  def advance(coerced_result_set) do
    DecipherAPI.Service.advance_datafeed(coerced_result_set.ack)
    coerced_result_set
  end

  @doc """
  Used in the case you need to reset the datafeed to get results from the
  beginning.
  """
  @spec reset(String.t) :: any
  def reset(survey_id) do
    DecipherAPI.Service.reset_datafeed(survey_id)
  end
end
