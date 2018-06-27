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

  @spec new() :: %Question{}
  def new() do
    %Question{}
  end

  @spec new(%{}) :: %Question{}
  def new(question) when is_map(question) do
    %{
      new() |
      grouping: question["grouping"],
      qlabel: question["qlabel"],
      qtitle: question["qtitle"],
      type: question["type"],
      values: Value.check_maybe_coerce(question["values"]),
      variables: Variables.coerce_maps(question["variables"])
    }
  end

  @spec coerce_maps([%{}]) :: %{}
  def coerce_maps(questions) when is_list(questions) do
    questions
    |> Enum.map(&new/1)
    |> Enum.into(Map.new, fn q -> {q.qlabel, q} end)
  end

end
