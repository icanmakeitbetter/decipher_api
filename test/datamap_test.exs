defmodule DecipherAPITest.DatamapTest do
  alias DecipherAPITest.Support.FakeData
  alias DecipherAPI.Datamap

  use ExUnit.Case, async: true
  @survey_url FakeData.survey_url
  @datamap %Datamap{survey_id: @survey_url}

  test "calling build_datamap_set fetches and coerces the data" do
    assert @datamap.questions == Map.new
    coerced = Datamap.build_metadata_set(@datamap)
    refute coerced.questions == Map.new
  end

  test "that calling Datamap.new() returns a new struct in the correct format" do
    assert Datamap.new("something/444/something") == @datamap
  end

  test "that coerce_data actually does that" do
    datamap = FakeData.raw_all_question_datamap_response
    assert is_list(datamap.questions)
    assert Enum.all?(datamap.questions, fn q ->
      is_map(q) and not Map.has_key?(q, :__struct__)
    end)
    assert is_binary(datamap.xml)

    coerced = Datamap.coerce_data(datamap)
    assert is_map(coerced.questions)
    assert Enum.all?(coerced.questions, fn
      {label, %Datamap.Question{qlabel: label}} ->
        true
      _kv ->
        false
    end)
    assert is_map(coerced.xml)
  end
end
