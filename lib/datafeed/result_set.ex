defmodule Datafeed.ResultSet do
  alias __MODULE__
  defstruct ack: nil, complete?: false, errors: %{}, results: []

  def new do
    %ResultSet{}
  end

  @doc """
  Get results for all surveys.
  """
  @spec build_result_set() :: %ResultSet{}
  def build_result_set() do
    get_results()
    |> result_set_process()
  end

  @doc """
  Get results for a single survey.

  ## Examples

    iex> Datafeed.ResultSet.build_result_set("all", "selfserve/555/180435")
  """
  @spec build_result_set(String.t, String.t) :: %ResultSet{}
  def build_result_set(scope, survey_url) do
    get_results(scope, survey_url)
    |> result_set_process()
  end

  def result_set_process(results) do
    results
    |> coerce_result_set(new())
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

  @spec check_if_more_results(%ResultSet{}) :: %ResultSet{} | fun()
  # TODO talk to James about how to match on complete? in struct rather than using if/else
  def check_if_more_results(coerced_result_set) do
    if coerced_result_set.complete? do
      coerced_result_set
    else
      get_results()
      |> coerce_result_set(coerced_result_set)
    end
  end

  @spec get_results(fun()) :: %{}
  def get_results(func \\ &API.get_survey_results/0) do
    func.()
  end

  @spec get_results(fun()) :: %{}
  def get_results(scope, survey_url, func \\ &API.get_survey_results/2) do
    func.(scope, survey_url)
  end

  @spec advance_datafeed(%ResultSet{}, fun()) :: %ResultSet{}
  def advance_datafeed(coerced_result_set, func \\ &API.advance_datafeed/1) do
    func.(coerced_result_set.ack)
    coerced_result_set
  end
end
