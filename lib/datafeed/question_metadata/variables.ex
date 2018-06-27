defmodule Datafeed.QuestionMetadata.Variables do
  alias Datafeed.QuestionMetadata.Value
  alias __MODULE__

  defstruct(
    col: nil,
    col_title:  nil,
    label: nil,
    qlabel: nil,
    qtitle: nil,
    row: nil,
    row_title: nil,
    title: nil,
    type: nil,
    values: nil,
    vgroup: nil
  )

  @spec new() :: %Variables{}
  def new() do
    %Variables{}
  end

  @spec new(%{}) :: %Variables{}
  def new(variable) when is_map(variable) do
    %{
      new() |
      col: variable["col"],
      col_title:  variable["colTitle"],
      label: variable["label"],
      qlabel: variable["qlabel"],
      qtitle: variable["qtitle"],
      row: variable["row"],
      row_title: variable["rowTitle"],
      title: variable["title"],
      type: variable["type"],
      values: Value.check_maybe_coerce(variable["values"]),
      vgroup: variable["vgroup"]
    }
  end

  @spec coerce_maps(%{}) :: [%{}]
  def coerce_maps(variables) do
    Enum.map(
      variables,
      fn(variable) -> new(variable)
    end)
  end

end
