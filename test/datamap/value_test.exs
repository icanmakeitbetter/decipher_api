defmodule DecipherAPITest.DatamapTest.ValueTest do
  alias DecipherAPI.Datamap.Value
  use ExUnit.Case, async: true

  test "that Value.new/0 creates a struct" do
    new_struct = %Value{title: "", value: nil}
    assert Value.new() == new_struct
  end

  test "that if nil is passed it returns nil" do
    assert Value.check_maybe_coerce(nil) == nil
  end

  test "that if a list of maps is passed it returns a list of struct/s" do
    values = [
      %{"title" => "Example1", "value" => 3},
      %{"title" => "Example2", "value" => 4}
    ]

    assert Value.check_maybe_coerce(values) == [
      %Value{title: "Example1", value: 3},
      %Value{title: "Example2", value: 4}
    ]
  end

  test "that passing a map returns a struct" do
    map = %{"title" => "Example2", "value" => 4}

    assert Value.coerce_data(map) == %Value{title: "Example2", value: 4}
  end
end
