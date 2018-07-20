defmodule DecipherAPI.Datamap.Question do
  alias __MODULE__
  alias DecipherAPI.Datamap.{Variables, Value}

  defstruct(
    grouping: nil,
    qlabel: nil,
    qtitle: nil,
    type: nil,
    __ui_type__: nil,
    values: nil,
    variables: nil
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

  @spec coerce_maps([%{}] | %{}) :: %{}
  def coerce_maps(questions) when is_map(questions) or is_list(questions) do
    questions
    |> Enum.map(&new/1)
    |> Enum.into(Map.new, fn(q) ->

         type      = q.type
         grouping  = q.grouping
         variables = q.variables

         ui_type =
           cond do
             single_select?(type, grouping) ->
               :single_select
             single_select_matrix?(type, grouping, variables) ->
               :single_select_matrix
             multi_select?(type, grouping) ->
               :multi_select
             multi_select_matrix?(type, grouping) ->
               :multi_select_matrix
             simple_number?(type, grouping) ->
               :number
             autosum?(type, grouping) ->
               :autosum
             float?(type) ->
               :float
             text?(type) ->
               :text
             true ->
               :unknown_type
           end

         {q.qlabel, %{q | __ui_type__: ui_type}}

       end)
  end

  def single_select?(type, grouping) do
    single?(type) && cols?(grouping)
  end

  def single_select_matrix?(type, grouping, variables) do
    single?(type) && rows?(grouping) && Enum.count(variables) > 1
  end

  def multi_select?(type, grouping) do
    multiple?(type) && cols?(grouping)
  end

  def multi_select_matrix?(type, grouping) do
    multiple?(type) && rows?(grouping)
  end

  def simple_number?(type, grouping) do
    number?(type) && rows?(grouping)
  end

  def autosum?(type, grouping) do
    number?(type) && cols?(grouping)
  end

  def cols?(grouping) do
    grouping == "cols"
  end

  def rows?(grouping) do
    grouping == "rows"
  end

  def single?(type) do
    type == "single"
  end

  def text?(type) do
    type == "text"
  end

  def multiple?(type) do
    type == "multiple"
  end

  def number?(type) do
    type == "number"
  end

  def float?(type) do
    type == "float"
  end

end
