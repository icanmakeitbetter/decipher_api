defmodule DecipherAPI.Datafeed do
  @moduledoc """
  How you get your survey results/answers from Decipher.

  Provides functions for interacting with Decipher's datafeed endpoint and
  coercing the results into something more useful.
  """
  alias DecipherAPI.Datafeed.ResultSet
  alias DecipherAPI.Datamap
  alias __MODULE__

  @scope_default "all"

  defstruct(
    scope: @scope_default,
    survey_id: nil
  )

  def new(survey_id, scope \\ @scope_default) do
    %Datafeed{
      scope: scope,
      survey_id: survey_id
    }
  end

  @doc """
  Get question results for a single survey, passing in a datafeed, and a datamap
  for coercion.

  ## Examples

    iex> DecipherAPI.Datafeed.get_process_coerce(
          %DecipherAPI.Datafeed{scope: "selfserve/555/survey1"},
          %DecipherAPI.Datamap{...})
  """
  @spec get_and_process(%Datafeed{}, %Datamap{} | nil, fun()) :: :ok | :error
  def get_and_process(datafeed, datamap \\ nil, fun) do
    result_set =
      datafeed
      |> get_results()
      |> ResultSet.new()
      |> ResultSet.process_results(datamap, fun)

    if advance(result_set, datafeed) do
      check_if_more_results(result_set, datafeed, fun)
      :ok
    else
      :error
    end
  end

  @spec get_results(%Datafeed{}) :: %{}
  def get_results(datafeed) do
    {:ok, response} = DecipherAPI.Service.get_survey_results(datafeed)
    response
  end

  @doc """
  Once a set of results are retrieved this function is called to acknowledge
  receipt so that the next time you call the datafeed you only get the new
  results.
  """
  @spec advance(%ResultSet{}, %Datafeed{}) :: boolean()
  def advance(result_set, datafeed) do
    {:ok, response} = DecipherAPI.Service.advance_datafeed(result_set, datafeed)
    response == %{"ack_valid" => true}
  end

  @spec check_if_more_results(%ResultSet{complete?: false}, %Datafeed{}, fun()) :: :ok | :error
  def check_if_more_results(%ResultSet{complete?: false}, datafeed, fun) do
    get_and_process(datafeed, fun)
  end

  @spec check_if_more_results(%ResultSet{complete?: true}, %Datafeed{}, fun()) :: :ok
  def check_if_more_results(_result_set, _datafeed, _fun) do
    :ok
  end

  @doc """
  Used in the case you need to reset the datafeed to get results from the
  beginning.
  """
  @spec reset(%Datafeed{}) :: {:ok, String.t} | {:error, String.t}
  def reset(datafeed) do
    case DecipherAPI.Service.reset_datafeed(datafeed) do
      {:ok, _} ->
        {:ok, "Reset successful."}
      {:error, error_message} ->
        {:error, error_message}
    end
  end
end
