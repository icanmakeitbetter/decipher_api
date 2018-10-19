require IEx
defmodule DecipherAPITest.DatafeedTest do
  alias DecipherAPITest.Support.InMemoryHTTPClient
  alias DecipherAPITest.Support.FakeData
  alias DecipherAPI.Datafeed
  alias DecipherAPI.Datafeed.ResultSet

  use ExUnit.Case, async: true
  @survey_id FakeData.survey_id()
  @account_info FakeData.account_info
  @datafeed Datafeed.new(@account_info, @survey_id)

  test "that new returns a new struct" do
    assert Datafeed.new(FakeData.account_info(), @survey_id) == @datafeed
  end

  test "that get_results returns the correct value" do
    assert Datafeed.get_results(@datafeed) ==
      FakeData.http_datafeed_body_map()
  end

  test "that advance returns a true response for the acknowledge code" do
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
                fn(_result, _metadata) ->
                  Agent.update(called, fn(_bool) -> true end)
                end)

    assert success == :ok
    assert Agent.get(called, &(&1))
  end

  test "that we process results without passing in a datamap" do
    InMemoryHTTPClient.queue_response(:get, :datafeed, FakeData.datafeed_complete_false())

    success = Datafeed.get_and_process(
                @datafeed,
                fn(result, _metadata) ->
                  assert %{"q1" => _q1, "q2" => _q2} = result
                end)
    assert success == :ok
  end

  test "that we process results when passing in a datamap" do
    InMemoryHTTPClient.queue_response(:get, :datafeed, FakeData.raw_all_question_datafeed_response())

    datamap =
      FakeData.raw_datamap

    success = Datafeed.get_and_process(
                @datafeed,
                datamap,
                fn(result, _metadata) ->
                  Enum.each(result, fn response ->
                    assert [%DecipherAPI.Datamap.Variables{}, _response] = response
                  end)
                end)
    assert success == :ok
  end

  test "that we error out in processing results when appropriate" do
    InMemoryHTTPClient.queue_response(:get, :datafeed, FakeData.datafeed_error_response())

    failure = Datafeed.get_and_process(
                @datafeed,
                fn(result, _metadata) ->
                  assert %{"q1" => _q1, "q2" => _q2} = result
                end)
    assert {:error, _} = failure
  end

end
