defmodule Datafeed.QuestionMetadataTest.QuestionTest do
  alias Datafeed.QuestionMetadata.Question
  alias Datafeed.FakeData
  use ExUnit.Case, async: true

  test "that Question.new/0 creates a struct" do
    assert Question.new() == FakeData.new_question_struct()
  end

  test "that Question.new/1 take a map and creates a struct" do
    assert Question.new(FakeData.raw_question_map()) ==
      FakeData.coerced_question_map()
  end

  test "that coerce_maps pulls the question and makes a keyed map" do
      assert Question.coerce_maps([FakeData.raw_question_map()]) ==
        %{"q1" => FakeData.coerced_question_map}
  end
end
