defmodule DecipherAPI.Datamap.Value do
  alias __MODULE__

  defstruct(
    title: "",
    value: nil
  )

  @spec new() :: %Value{}
  def new() do
    %Value{}
  end

  def check_maybe_coerce(nil) do
    nil
  end

  @spec check_maybe_coerce([%{}]) :: [%Value{}]
  def check_maybe_coerce(values) when is_list(values) do
    values
    |> Enum.map(&coerce_data/1)
    |> Enum.into(Map.new(), fn v -> {v.value, v.title} end)
  end

  @spec coerce_data(%{}) :: %Value{}
  def coerce_data(value_pair) when is_map(value_pair) do
    %{
      title: value_pair["title"],
      value: value_pair["value"]
    }
  end
end
