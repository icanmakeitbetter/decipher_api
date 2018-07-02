defmodule DecipherAPI.Datamap do
  @moduledoc """
  How you get questions, question metadata, and metadata about a survey from Decipher.

  Provides functions for interacting with Decipher's datamap endpoint and coercing
  that data into something more useful.
  """
  alias DecipherAPI.Datamap.{Question, Variables}
  alias __MODULE__

  defstruct(
    questions: [],
    variables: []
  )

  @spec new() :: %Datamap{}
  def new() do
    %Datamap{}
  end

  @spec build_metadata_set(String.t) :: %Datamap{}
  def build_metadata_set(survey_id) do
    survey_id
    |> get_question_metadata()
    |> coerce_data()
  end

  @spec get_question_metadata(String.t) :: %{}
  def get_question_metadata(survey_id) when is_binary(survey_id) do
    DecipherAPI.Service.get_question_metadata(survey_id)
  end

  @spec coerce_data(%{}) :: %Datamap{}
  def coerce_data(question_metadata) when is_map(question_metadata) do
    %{
      new() |
      questions: Question.coerce_maps(question_metadata["questions"]),
      variables: Variables.coerce_maps(question_metadata["variables"])
    }
  end

end
