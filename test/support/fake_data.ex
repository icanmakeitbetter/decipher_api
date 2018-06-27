defmodule Datafeed.FakeData do
  alias Datafeed.QuestionMetadata.{Question, Variables}
  alias Datafeed.QuestionMetadata
  alias Datafeed.Result

  def new_result_struct do
    %Result{
      survey_url: "",
      date: nil,
      uuid: nil,
      questions_answers: %{},
      raw_result: %{}
    }
  end

  def raw_question_metadata_map do
    %{"questions" => [], "variables" => []}
  end

  def new_question_metadata_struct do
    %QuestionMetadata{
      questions: [],
      variables: []
    }
  end

  def coerced_question_metadata_struct do
    %QuestionMetadata{
      questions: %{},
      variables: []
    }
  end

  def raw_result_map do
    %{
      "$survey" => "selfserve/555/best",
      "date" => "06/04/2018 13:41",
      "dcua" => "..",
      "ipAddress" => "198.57.81.230",
      "list" => "0",
      "markers" => "qualified",
      "q1" => "5016664532",
      "q2" => "4",
      "qtime" => "18.036247014999",
      "record" => "3",
      "session" => "0m1uhfdm2tcnuuec",
      "start_date" => "06/04/2018 13:41",
      "status" => "3",
      "url" => "/survey/selfserve/540/grumble",
      "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36",
      "uuid" => "6guu10sw23pkzu7d",
      "vbrowser" => "10",
      "vlist" => "1",
      "vmobiledevice" => "5",
      "vmobileos" => "6",
      "vos" => "13"
    }
  end

  def raw_variables_map do
    [
      %{
        "col" => nil,
        "colTitle" => nil,
        "label" => "q1",
        "qlabel" => "q1",
        "qtitle" => "What's your number?",
        "row" => nil,
        "rowTitle" => nil,
        "title" => "What's your number?",
        "type" => "number",
        "vgroup" => "q1"
      }
    ]
  end

  def raw_question_map do
    %{
      "grouping" => "rows",
      "qlabel" => "q1",
      "qtitle" => "What's your number?",
      "type" => "number",
      "variables" => raw_variables_map()
    }
  end

  def coerced_variables_map do
    %Variables{
      col: nil,
      col_title:  nil,
      label: "q1",
      qlabel: "q1",
      qtitle: "What's your number?",
      row: nil,
      row_title: nil,
      title: "What's your number?",
      type: "number",
      values: nil,
      vgroup: "q1"
    }
  end

  def coerced_question_map do
    %Question{
      grouping: "rows",
      qlabel: "q1",
      qtitle: "What's your number?",
      type: "number",
      values: nil,
      variables: [
        coerced_variables_map()
      ]
    }
  end

  def new_question_struct do
    %Question{
      grouping: "",
      qlabel: "",
      qtitle: "",
      type: "",
      values: [],
      variables: []
    }
  end
end
