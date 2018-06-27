defmodule Datafeed.ResultSetTest do
  alias Datafeed.ResultSet
  use ExUnit.Case, async: true

  test "that the get_question_metadata function is there" do
    api_call = fn _ ->
      send self(), :api_call
    end

    ResultSet.get_question_metadata("selfserve/540/grumble", api_call)
    assert_received :api_call
  end

  test "that the call down into the get_results function in the API module is there" do
    api_call = fn _, _ ->
      send self(), :api_call
    end

    ResultSet.get_results("all", "selfserve/540/grumble", api_call)
    assert_received :api_call
  end

  test "that the advance_datafeed function is there" do
    api_call = fn _ ->
      send self(), :api_call
    end

    ResultSet.advance_datafeed(%ResultSet{ack: "asdfwer"}, api_call)
    assert_received :api_call
  end

end
