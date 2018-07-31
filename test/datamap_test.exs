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

  test "test that the question_order field gives us an ordered list" do
    assert Datamap.get_question_metadata(%Datamap{survey_id: "something/555/something"}).question_order() ==
      [
       "q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "q10",
       "q13", "q14", "q15", "q33", "q34", "q16", "q20", "q22", "q23", "q24", "q25",
       "q25_norm", "q28", "q29", "q31", "q30", "q21", "q32", "q35", "q36", "q37",
       "q39", "noanswer", "qtime", "start_date"
      ]
  end
end
