defmodule DecipherAPITest.DatamapTest do
  alias DecipherAPITest.Support.FakeData
  alias DecipherAPI.Datamap

  # FIXME: needs updating
  use ExUnit.Case, async: true
  @survey_id FakeData.survey_id()
  @account_info FakeData.account_info_struct()
  @datamap %Datamap{account_info: @account_info, survey_id: @survey_id}

  test "calling build_datamap_set fetches and coerces the data" do
    assert @datamap.questions == Map.new()
    coerced = Datamap.build_metadata_set(@datamap)
    refute coerced.questions == Map.new()
  end

  # FIXME: needs updating
  test "that calling Datamap.new() returns a new struct in the correct format" do
    assert Datamap.new(FakeData.account_info(), @survey_id) == @datamap
  end

  test "that coerce_data actually does that" do
    datamap = FakeData.raw_all_question_datamap_response()
    assert is_list(datamap.questions)

    assert Enum.all?(datamap.questions, fn q ->
             is_map(q) and not Map.has_key?(q, :__struct__)
           end)

    assert is_binary(datamap.xml)

    coerced = Datamap.coerce_data(datamap)
    assert is_list(coerced.questions)

    assert Enum.all?(coerced.questions, fn
             %Datamap.Question{qlabel: _label} ->
               true

             _kv ->
               false
           end)

    assert is_map(coerced.xml)
  end

  test "test that the page_grouping field gives us an ordered list" do
    assert Datamap.build_metadata_set(@datamap).page_grouping() ==
     [
       [
         "q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "cm1",
         "q10", "q27", "q13", "q14", "q15", "q33", "q34", "q16", "q20",
         "q22", "q23", "q24", "q25", "q28", "q29", "q31", "q30", "q21",
         "q32", "q35", "q36", "q37", "q38", "q39", "q40", "q41"
       ]
     ]
  end
end
