defmodule DecipherAPI.Datamap.Value do

  def check_maybe_coerce(nil) do
    nil
  end

  @spec check_maybe_coerce([%{}]) :: [%{}]
  def check_maybe_coerce(values) when is_list(values) do
    values
    |> Enum.into([], fn v ->
         [v["value"], v["title"]] 
       end)
  end

end
