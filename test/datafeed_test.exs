defmodule DecipherAPITest.DatafeedTest do
  alias DecipherAPITest.Support.InMemoryHTTPClient
  alias DecipherAPITest.FakeData
  alias DecipherAPI.Datafeed

  use ExUnit.Case, async: true

  test "that new returns a new struct" do
    assert Datafeed.new() == %Datafeed{}
  end

  test "that get_results returns the correct value" do
    assert Datafeed.get_results("all", "selfserve/555/survey1") ==
      FakeData.http_datafeed_body_map()
  end

  test "that advance returns the struct that was passed in" do
    assert Datafeed.advance(%Datafeed{ack: "asdf-asdf-asdf-asdf"}) ==
      %Datafeed{ack: "asdf-asdf-asdf-asdf"}
  end

  test "that reset returns" do
    assert Datafeed.reset("selfserve/555/survey1") == %{}
  end

  test "that build_result_set builds the actual result set" do
    InMemoryHTTPClient.queue_response(:get, :datafeed, FakeData.datafeed_complete_false())
    assert Datafeed.build_result_set("all", "selfserve/555/survey1") ==
      FakeData.datafeed_paginated_concat()
  end

end
