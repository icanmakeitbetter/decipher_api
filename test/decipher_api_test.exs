defmodule DecipherApiTest do
  use ExUnit.Case, async: true

  test "that the reset function is there" do
    api_call = fn _ ->
      send self(), :api_call
    end

    Datafeed.reset("selfserve/540/grumble", api_call)
    assert_received :api_call
  end

end
