defmodule Datafeed.QuestionMetadata.Value do
  alias __MODULE__

  defstruct(
    title: "",
    value: nil
  )

  def new() do
    %Value{}
  end

  def check_maybe_coerce(nil) do
    nil
  end

  @spec check_maybe_coerce([]) :: []
  def check_maybe_coerce(values) do
    Enum.map(
      values,
      fn(value) -> coerce_data(value)
    end)
  end

  @spec coerce_data(%{}) :: %Value{}
  defp coerce_data(value_pair) do
    %{
      new() |
      title: value_pair["title"],
      value: value_pair["value"]
    }
  end
end
