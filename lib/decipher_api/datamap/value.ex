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
    Enum.map(
      values,
      fn(value) -> coerce_data(value)
    end)
  end

  @spec coerce_data(%{}) :: %Value{}
  def coerce_data(value_pair) when is_map(value_pair) do
    %{
      new() |
      title: value_pair["title"],
      value: value_pair["value"]
    }
  end
end
