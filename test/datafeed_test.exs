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
    {:ok, called} = Agent.start_link(fn() -> false end)
    success = Datafeed.check_if_more_results(
                %ResultSet{complete?: false},
                @datafeed,
                fn(_result) -> Agent.update(called, fn(_bool) -> true end)
              end)

    assert success == :ok
    assert Agent.get(called, &(&1))
  end

  test "that build_result_set builds the actual result set" do
    InMemoryHTTPClient.queue_response(:get, :datafeed, FakeData.datafeed_complete_false())

    success = Datafeed.get_and_process(
                @datafeed,
                fn(result) -> assert %{"q1" => _q1, "q2" => _q2} = result
              end)
    assert success == :ok
  end

end
