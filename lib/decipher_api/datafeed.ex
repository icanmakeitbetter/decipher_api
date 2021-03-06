defmodule DecipherAPI.Datafeed do
  @moduledoc """
  How you get your survey results/answers from Decipher.

  Provides functions for interacting with Decipher's datafeed endpoint and
  coercing the results into something more useful.
  """
  alias DecipherAPI.Datafeed.ResultSet
  alias DecipherAPI.{AccountInfo, Datamap, Service}
  alias __MODULE__

  defstruct ~w[account_info scope survey_id]a

  @spec new(%{}, String.t, String.t | nil) :: %Datafeed{}
  def new(account_info, survey_id, scope \\ nil) do
    %Datafeed{
      account_info: AccountInfo.new(account_info),
      scope: scope || "feed_#{survey_id}",
      survey_id: survey_id
    }
  end

  @spec get_and_process(%Datafeed{}, %Datamap{} | nil, fun()) :: :ok | :error | {:error, String.t}
  def get_and_process(datafeed, datamap \\ nil, fun) do
    datafeed
    |> get_results()
    |> case do
      {:error, _msg } = error ->
        error
      response when is_map(response) ->
        result_set =
          response
          |> ResultSet.new()
          |> ResultSet.process_results(datamap, fun)

        if advance(result_set, datafeed) do
          check_if_more_results(result_set, datafeed, fun)
          :ok
        else
          :error
        end
    end
  end

  @spec get_results(
    %Datafeed{
      account_info: %AccountInfo{
        api_key: String.t,
        domain: String.t,
        survey_url_prefix: String.t
      },
      scope: String.t,
      survey_id: String.t
    }
  ) :: %{} | {:error, String.t}
  def get_results(
    %Datafeed{
      account_info: account_info,
      scope: scope,
      survey_id: survey_id
    }
  ) do
    with {:ok, response} <- Service.get_survey_results(account_info, scope, survey_id) do
      response
    end
  end

  @doc """
  Once a set of results are retrieved this function is called to acknowledge
  receipt so that the next time you call the datafeed you only get the new
  results.
  """
  @spec advance(%ResultSet{}, %Datafeed{}) :: boolean() | {:error, String.t}
  def advance(
    %ResultSet{ack: ack_code},
    %Datafeed{account_info: account_info, scope: scope}
  ) do
    with {:ok, response} <- Service.advance_datafeed(account_info, ack_code, scope) do
      response == %{"ack_valid" => true}
    end
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
  def reset(%Datafeed{account_info: account_info, scope: scope}) do
    with {:ok, _} <- Service.reset_datafeed(account_info, scope) do
      {:ok, "Reset successful."}
    end
  end
end
