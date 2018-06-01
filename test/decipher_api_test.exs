defmodule DecipherApiTest do
  use ExUnit.Case
  doctest DecipherApi

  test "greets the world" do
    assert DecipherApi.hello() == :world
  end
end
