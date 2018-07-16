defmodule DecipherAPITest.DatamapTest.ValueTest do
  alias DecipherAPI.Datamap.Value
  use ExUnit.Case, async: true

  test "that if nil is passed it returns nil" do
    assert Value.check_maybe_coerce(nil) == nil
  end

  test "that if a list of maps is passed it returns a keyed map" do
    values = [
      %{"title" => "Example1", "value" => 1},
      %{"title" => "Example2", "value" => 2},
      %{"title" => "Example3", "value" => 3},
      %{"title" => "Example4", "value" => 4}
    ]

    assert Value.check_maybe_coerce(values) == %{1 => "Example1", 2 => "Example2", 3 => "Example3", 4 => "Example4"}
  end

end
