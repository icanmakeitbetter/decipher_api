defmodule Datafeed.QuestionMetadata do
  alias Datafeed.QuestionMetadata.{Question, Variables}
  alias __MODULE__

  defstruct(
    questions: [],
    variables: []
  )

  @spec new() :: %QuestionMetadata{}
  def new() do
    %QuestionMetadata{}
  end

  @spec coerce_data(%{}) :: %QuestionMetadata{}
  def coerce_data(question_metadata) when is_map(question_metadata) do
    %{
      new() |
      questions: Question.coerce_maps(question_metadata["questions"]),
      variables: Variables.coerce_maps(question_metadata["variables"])
    }
  end
end
