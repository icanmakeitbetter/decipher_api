defmodule DecipherAPITest.DatamapTest do
  alias DecipherAPITest.Support.FakeData
  alias DecipherAPI.Datamap
  alias DecipherAPITest.Support.InMemoryHTTPClient

  use ExUnit.Case, async: true
  @survey_id FakeData.survey_id()
  @account_info FakeData.account_info_struct()
  @datamap %Datamap{account_info: @account_info, survey_id: @survey_id}

  test "calling build_datamap_set fetches and coerces the data" do
    assert @datamap.questions == Map.new()
    coerced = Datamap.build_metadata_set(@datamap)
    refute coerced.questions == Map.new()
  end

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

  test "test that loops get coerced" do
    datamap =
      FakeData.raw_loop_datamap_response
      |> Datamap.coerce_data()

    assert is_map(datamap.xml)
  end

  test "calculated values are preserved" do
    InMemoryHTTPClient.queue_response(
      :get,
      :datamap,
      load_fixture("dv_elements.json")
    )
    InMemoryHTTPClient.queue_response(
      :get,
      :datamap,
      load_fixture("dv_elements.xml")
    )

    parsed =
      @datamap
      |> Datamap.build_metadata_set

    parsed.page_grouping
    |> List.flatten
    |> Enum.find(fn name -> name == "dv_panel" end)
    |> is_nil
    |> refute

    parsed.questions
    |> Enum.find(fn q -> q.qlabel == "dv_panel" end)
    |> is_nil
    |> refute
  end

  defp load_fixture(file) do
    body =
      Path.expand("support/#{file}", __DIR__)
      |> File.read!
    %HTTPoison.Response{status_code: 200, body: body}
  end
end
