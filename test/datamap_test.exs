defmodule DecipherAPITest.DatamapTest do
  alias DecipherAPITest.FakeData
  alias DecipherAPI.Datamap

  use ExUnit.Case, async: true

  test "that calling Datamap.new() returns a new struct in the correct format" do
    assert Datamap.new() == FakeData.new_question_metadata_struct()
  end

  test "that coerce_data actually does that" do
    assert Datamap.coerce_data(FakeData.raw_question_metadata_map()) ==
      FakeData.coerced_question_metadata_struct()
  end

  test "that get_question_metadata gets the question metadata map" do
    assert Datamap.get_question_metadata("selfserve/555/survey1") == FakeData.metadata_map()
  end
end
