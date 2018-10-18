defmodule DecipherAPI.Datamap.Question do
  alias __MODULE__
  alias DecipherAPI.Datamap.{Variables, Value}

  defstruct(
    comment: nil,
    grouping: nil,
    qlabel: nil,
    qtitle: nil,
    range: nil,
    size: nil,
    optional: false,
    type: nil,
    __ui_type__: nil,
    values: nil,
    variables: nil,
    xml_tag_name: nil
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

  @spec coerce_maps([%{}] | %{}, %{}) :: %{}
  def coerce_maps(datamap_metadata, xml_metadata) when is_list(datamap_metadata) do
    datamap_metadata
    |> Enum.map(&new/1)
    |> Enum.into([], fn(q) ->

       type        = q.type
       label       = q.qlabel
       grouping    = q.grouping
       values      = q.values
       variables   = q.variables
       xml_ui_type = get_uses_or_nil(xml_metadata, label)

       ui_type =
         cond do
           xml_ui_type ->
             xml_ui_type
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
           float?(type) ->
             :float
           text?(type) ->
             :text
           dropdown?(type, grouping, values) ->
             :dropdown
           true ->
             :unknown_type
         end

       %{
         q |
         __ui_type__: ui_type,
         comment: xml_map_lookup(xml_metadata, label, :comment),
         range: xml_map_lookup(xml_metadata, label, :verify),
         size: xml_map_lookup(xml_metadata, label, :size),
         optional: xml_map_lookup(xml_metadata, label, :optional) == "1",
         xml_tag_name: xml_map_lookup(xml_metadata, label, :tag_name)
       }

    end)
  end

  @spec get_uses_or_nil(%{}, String.t) :: String.t | nil
  defp get_uses_or_nil(xml_metadata, label) do
    metadata = Map.get(xml_metadata, label)
    if metadata do
      Map.get(metadata, :uses)
    else
      nil
    end
  end

  @spec xml_map_lookup(%{}, String.t, :atom) :: String.t | nil
  defp xml_map_lookup(xml_metadata, label, key) do
    metadata = Map.get(xml_metadata, label)
    if metadata do
      Map.get(metadata, key)
    else
      nil
    end
  end

  defp single_select?(type, grouping) do
    single?(type) && cols?(grouping)
  end

  defp single_select_matrix?(type, grouping, variables) do
    single?(type) && rows?(grouping) && Enum.count(variables) > 1
  end

  defp multi_select?(type, grouping) do
    multiple?(type) && cols?(grouping)
  end

  defp multi_select_matrix?(type, grouping) do
    multiple?(type) && rows?(grouping)
  end

  defp simple_number?(type, grouping) do
    number?(type) && rows?(grouping)
  end

  defp dropdown?(type, grouping, values) do
    single?(type) && rows?(grouping) && Enum.count(values) > 1
  end

  defp cols?(grouping) do
    grouping == "cols"
  end

  defp rows?(grouping) do
    grouping == "rows"
  end

  defp single?(type) do
    type == "single"
  end

  defp text?(type) do
    type == "text"
  end

  defp multiple?(type) do
    type == "multiple"
  end

  defp number?(type) do
    type == "number"
  end

  defp float?(type) do
    type == "float"
  end

end
