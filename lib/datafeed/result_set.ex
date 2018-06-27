defmodule Datafeed.ResultSet do
  alias Datafeed.{QuestionMetadata, Result}
  alias __MODULE__

  defstruct(
    ack: nil,
    complete?: false,
    errors: %{},
    results: [],
    metadata: %{}
  )

  def new do
    %ResultSet{}
  end

  @doc """
  Get question metadata and results for a single survey.

  ## Examples

    iex> Datafeed.ResultSet.build_result_set("all", "selfserve/555/180435")
  """
  @spec build_result_set(String.t, String.t) :: %ResultSet{}
  def build_result_set(scope, survey_id, result_set_struct \\ new())
      when is_binary(scope)
      and is_binary(survey_id) do
    get_results(scope, survey_id)
    |> coerce_result_set(result_set_struct)
    |> coerce_metadata(survey_id)
    |> advance_datafeed()
    |> check_if_more_results(scope, survey_id)
  end

  @spec coerce_result_set(%{}, %ResultSet{}) :: %ResultSet{}
  def coerce_result_set(results, result_set_struct) when is_map(results) do
    coerced_results =
      Enum.map(
        results["results"],
        fn(single_result_map) -> Result.coerce_data(single_result_map)
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

  @spec coerce_metadata(%ResultSet{}, String.t) :: %ResultSet{}
  def coerce_metadata(coerced_result, survey_id) when is_binary(survey_id) do
    metadata = get_question_metadata(survey_id)
    %{
      coerced_result |
      metadata: QuestionMetadata.coerce_data(metadata)
    }
  end

  @spec check_if_more_results(%ResultSet{}, String.t, String.t) :: %ResultSet{}
  def check_if_more_results(%ResultSet{complete?: true} = coerced_result_set, _scope, _survey_id) do
    coerced_result_set
  end

  def check_if_more_results(coerced_result_set, scope, survey_id)
      when is_binary(scope)
      and is_binary(survey_id) do
    build_result_set(scope, survey_id, coerced_result_set)
  end

  @spec get_question_metadata(String.t, fun()) :: %{}
  def get_question_metadata(survey_id, func \\ &API.get_question_metadata/1)
      when is_binary(survey_id)
      and is_function(func) do
    func.(survey_id)
  end

  @spec get_results(String.t, String.t, fun()) :: %{}
  def get_results(scope, survey_id, func \\ &API.get_survey_results/2)
      when is_binary(scope)
      and is_binary(survey_id)
      and is_function(func) do
    func.(scope, survey_id)
  end

  @spec advance_datafeed(%ResultSet{}, fun()) :: %ResultSet{}
  def advance_datafeed(coerced_result_set, func \\ &API.advance_datafeed/1)
      when is_function(func) do
    func.(coerced_result_set.ack)
    coerced_result_set
  end
end
