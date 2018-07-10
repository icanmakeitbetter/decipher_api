defmodule DecipherAPI.Datamap do
  @moduledoc """
  How you get questions, question metadata, and metadata about a survey from Decipher.

  Provides functions for interacting with Decipher's datamap endpoint and coercing
  that data into something more useful.
  """
  alias DecipherAPI.Datamap.{Question, Variables}
  alias __MODULE__

  defstruct(
    survey_id: nil,
    questions: %{},
    variables: []
  )

  @spec new(binary()) :: %Datamap{}
  def new(survey_id) do
    %{
      %Datamap{} |
      survey_id: survey_id
    }
  end

  @spec build_metadata_set(%Datamap{}) :: %Datamap{}
  def build_metadata_set(datamap) do
    datamap
    |> get_question_metadata()
    |> coerce_data()
  end

  @spec get_question_metadata(%Datamap{}) :: %Datamap{}
  def get_question_metadata(%Datamap{survey_id: survey_id} = datamap) when is_binary(survey_id) do
    metadata = DecipherAPI.Service.get_question_metadata(survey_id)

    %{
      datamap |
      questions: metadata["questions"],
      variables: metadata["variables"]
    }
  end

  @spec coerce_data(%Datamap{}) :: %Datamap{}
  def coerce_data(datamap) do
    %{
      datamap |
      questions: Question.coerce_maps(datamap.questions),
      variables: Variables.coerce_maps(datamap.variables)
    }
  end

end
