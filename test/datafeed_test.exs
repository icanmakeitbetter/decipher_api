defmodule DecipherAPITest.DatafeedTest do
  alias DecipherAPITest.Support.InMemoryHTTPClient
  alias DecipherAPITest.Support.FakeData
  alias DecipherAPI.Datafeed
  alias DecipherAPI.Datafeed.ResultSet

  use ExUnit.Case, async: true
  @survey_url FakeData.survey_url
  @datafeed %Datafeed{survey_id: @survey_url}

  test "that new returns a new struct" do
    assert Datafeed.new(@survey_url) == @datafeed
  end

  test "that get_results returns the correct value" do
    assert Datafeed.get_results(@datafeed) ==
      FakeData.http_datafeed_body_map()
  end

  test "that advance returns true response for acknowledge code" do
    assert Datafeed.advance(%ResultSet{ack: "asdf-asdf-asdf-asdf"}, @datafeed) == true
  end

  test "that reset returns" do
    assert Datafeed.reset(@datafeed) == {:ok, "Reset successful."}
  end

  test "we hit the complete false function head of check_if_more_results" do
    assert Datafeed.check_if_more_results(%ResultSet{complete?: false}, @datafeed) == :ok
  end

  test "that build_result_set builds the actual result set" do
    InMemoryHTTPClient.queue_response(:get, :datafeed, FakeData.datafeed_complete_false())
    assert Datafeed.get_and_process(@datafeed) == :ok
  end

end
