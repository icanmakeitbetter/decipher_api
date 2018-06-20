defmodule Datafeed.QuestionMetadata do
  alias Datafeed.QuestionMetadata.{Question, Variables}
  alias __MODULE__

  defstruct(
    questions: [],
    variables: []
  )

  def new() do
    %QuestionMetadata{}
  end

  @spec coerce_data(%{}) :: struct
  def coerce_data(question_metadata) do
    %{
      new() |
      questions: Enum.map(
        question_metadata["questions"],
        fn(question_map) -> Question.coerce_data(question_map)
      end),
      variables: Enum.map(
        question_metadata["variables"],
        fn(variable) -> Variables.coerce_data(variable) end)
    }
  end
end
