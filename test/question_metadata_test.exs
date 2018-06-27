defmodule Datafeed.QuestionMetadataTest do
  alias Datafeed.QuestionMetadata
  alias Datafeed.FakeData

  use ExUnit.Case, async: true

  test "that calling QuestionMetadata.new() returns a new struct in the correct format" do
    assert QuestionMetadata.new() == FakeData.new_question_metadata_struct()
  end

  test "that coerce_data actually does that" do
    assert QuestionMetadata.coerce_data(FakeData.raw_question_metadata_map()) ==
      FakeData.coerced_question_metadata_struct()
  end
end
