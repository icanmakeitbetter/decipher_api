defmodule DecipherAPITest.DatamapTest do
  alias DecipherAPITest.Support.FakeData
  alias DecipherAPI.Datamap

  use ExUnit.Case, async: true
  @survey_url FakeData.survey_url
  @datamap %Datamap{survey_id: @survey_url}

  test "that calling build_datamap_set returns a coerced struct" do
    assert Datamap.build_metadata_set(@datamap) == FakeData.coerced_metadata()
  end

  test "that calling Datamap.new() returns a new struct in the correct format" do
    assert Datamap.new("something/444/something") == @datamap
  end

  test "that coerce_data actually does that" do
    assert Datamap.coerce_data(%Datamap{}) ==
      FakeData.coerced_question_metadata_struct()
  end

  test "that get_datamap_metadata gets the question metadata map" do
    assert Datamap.get_question_metadata(@datamap) == FakeData.metadata()
  end
end
