defmodule DecipherAPITest.ResultTest do
  alias DecipherAPITest.Support.FakeData
  alias DecipherAPI.Datafeed.ResultSet.Result

  use ExUnit.Case, async: true

  test "that calling new() returns a struct" do
    assert Result.new() == FakeData.new_result_struct()
 end

  test "that passing a map drops all keys save for q1, q2, etc" do
    map = %{"date" => 1, "list" => 2, "q1" => 1, "q2" => 2}

    assert Result.get_answers(map) == %{"q1" => 1, "q2" => 2}
  end

  test "that passing in a raw result map returns the correct shape of data" do
    assert Result.coerce_data(FakeData.raw_result_map()) == %Result{
      survey_url: "selfserve/555/best",
      date: ~N[2018-06-04 13:41:00],
      uuid: "6guu10sw23pkzu7d",
      answers: %{
        "q1" => "5016664532",
        "q2" => "4",
        },
        raw_result: FakeData.raw_result_map()
      }
    end

  end
