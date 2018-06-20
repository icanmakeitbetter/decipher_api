defmodule Datafeed.ResultSet do
  alias __MODULE__
  defstruct(
    ack: nil,
    complete?: false,
    errors: %{},
    results: [],
    metadata: %{
    }
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
  def build_result_set(scope, survey_id) do
    get_results(scope, survey_id)
    |> result_set_process(survey_id)
  end

  def result_set_process(results, survey_id) do
    results
    |> coerce_result_set(new())
    |> coerce_metadata(survey_id)
    |> advance_datafeed()
    |> check_if_more_results()
  end

  @spec coerce_result_set(%{}, %ResultSet{}) :: %ResultSet{}
  def coerce_result_set(results, result_set_struct) do
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

  @spec coerce_metadata(%ResultSet{}, String.t) :: %ResultSet{}
  def coerce_metadata(coerced_result, survey_id) do
    metadata = get_question_metadata(survey_id)
    %{
      coerced_result |
      metadata: Datafeed.QuestionMetadata.coerce_data(metadata)
    }
  end

  @spec check_if_more_results(%ResultSet{}) :: %ResultSet{} | fun()
  def check_if_more_results(coerced_result_set) do
    if coerced_result_set.complete? do
      coerced_result_set
    else
      get_results()
      |> coerce_result_set(coerced_result_set)
    end
  end

  @spec get_question_metadata(String.t, fun()) :: %{}
  def get_question_metadata(survey_id, func \\ &API.get_question_metadata/1) do
    func.(survey_id)
  end

  @spec get_results(fun()) :: %{}
  def get_results(func \\ &API.get_survey_results/0) do
    func.()
  end

  @spec get_results(String.t, String.t, fun()) :: %{}
  def get_results(scope, survey_id, func \\ &API.get_survey_results/2) do
    func.(scope, survey_id)
  end

  @spec advance_datafeed(%ResultSet{}, fun()) :: %ResultSet{}
  def advance_datafeed(coerced_result_set, func \\ &API.advance_datafeed/1) do
    func.(coerced_result_set.ack)
    coerced_result_set
  end
end
