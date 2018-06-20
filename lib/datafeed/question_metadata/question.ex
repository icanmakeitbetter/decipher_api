defmodule Datafeed.QuestionMetadata.Question do
  alias __MODULE__
  alias Datafeed.QuestionMetadata.{Variables, Value}

  defstruct(
    grouping: "",
    qlabel: "",
    qtitle: "",
    type: "",
    values: [],
    variables: []
  )

  def new() do
    %Question{}
  end

  def coerce_data(question) do
    %{
      new() |
      grouping: question["grouping"],
      qlabel: question["qlabel"],
      qtitle: question["qtitle"],
      type: question["type"],
      values: Value.check_maybe_coerce(question["values"]),
      variables: Enum.map(
        question["variables"],
        fn(variable) -> Variables.coerce_data(variable)
      end)
    }
  end
end
