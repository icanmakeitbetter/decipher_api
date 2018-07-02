defmodule DecipherAPITest.FakeData do
  alias DecipherAPI.Datafeed.Result
  alias DecipherAPI.Datamap.{Question, Variables}
  alias DecipherAPI.Datamap

  def response_status_code(code) do
    %HTTPoison.Response{status_code: code}
  end

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
    %Datamap{
      questions: [],
      variables: []
    }
  end

  def coerced_question_metadata_struct do
    %Datamap{
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

  def http_datafeed_body_map do
    %{"ack" => "58adf6c4-80b5-41e6-ae0b-ba902c56facf", "complete" => true, "errors" => %{}, "results" => [%{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:40", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "4444444444", "q2" => "1", "qtime" => "26.13196301465", "record" => "1", "session" => "fwgycn85f1vrw03w", "start_date" => "06/04/2018 13:40", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "v9er20g6v4wtqx3t", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:41", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "5555555555", "q2" => "3", "qtime" => "12.493089914322", "record" => "2", "session" => "skv6zft8kn1uh3zz", "start_date" => "06/04/2018 13:41", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "v2wgz1523zw31kqf", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:41", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "5016664532", "q2" => "4", "qtime" => "18.036247014999", "record" => "3", "session" => "0m1uhfdm2tcnuuec", "start_date" => "06/04/2018 13:41", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "6guu10sw23pkzu7d", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}]}
  end

  def coerced_datafeed_struct do
    %DecipherAPI.Datafeed{errors: %{}, metadata: %{}, ack: "58adf6c4-80b5-41e6-ae0b-ba902c56facf", complete?: true, results: [%DecipherAPI.Datafeed.Result{date: ~N[2018-06-04 13:40:00], questions_answers: %{"q1" => "4444444444", "q2" => "1"}, raw_result: %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:40", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "4444444444", "q2" => "1", "qtime" => "26.13196301465", "record" => "1", "session" => "fwgycn85f1vrw03w", "start_date" => "06/04/2018 13:40", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "v9er20g6v4wtqx3t", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, survey_url: "selfserve/555/survey1", uuid: "v9er20g6v4wtqx3t"}, %DecipherAPI.Datafeed.Result{date: ~N[2018-06-04 13:41:00], questions_answers: %{"q1" => "5555555555", "q2" => "3"}, raw_result: %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:41", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "5555555555", "q2" => "3", "qtime" => "12.493089914322", "record" => "2", "session" => "skv6zft8kn1uh3zz", "start_date" => "06/04/2018 13:41", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "v2wgz1523zw31kqf", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, survey_url: "selfserve/555/survey1", uuid: "v2wgz1523zw31kqf"}, %DecipherAPI.Datafeed.Result{date: ~N[2018-06-04 13:41:00], questions_answers: %{"q1" => "5016664532", "q2" => "4"}, raw_result: %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:41", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "5016664532", "q2" => "4", "qtime" => "18.036247014999", "record" => "3", "session" => "0m1uhfdm2tcnuuec", "start_date" => "06/04/2018 13:41", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "6guu10sw23pkzu7d", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, survey_url: "selfserve/555/survey1", uuid: "6guu10sw23pkzu7d"}]}
  end

  def metadata_map do
    %{
      "questions" => [
        %{
          "grouping" => "rows",
          "qlabel" => "q1",
          "qtitle" => "What's your number?",
          "type" => "number",
          "variables" => [
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
        },
        %{
          "grouping" => "cols",
          "qlabel" => "q2",
          "qtitle" => "Pizza?",
          "type" => "single",
          "values" => [
            %{"title" => "Yes", "value" => 1},
            %{"title" => "No", "value" => 2},
            %{"title" => "I hate it", "value" => 3},
            %{"title" => "I guess", "value" => 4}
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q2",
              "qlabel" => "q2",
              "qtitle" => "Pizza?",
              "row" => nil,
              "rowTitle" => nil,
              "title" => "Pizza?",
              "type" => "single",
              "values" => [
                %{"title" => "Yes", "value" => 1},
                %{"title" => "No", "value" => 2},
                %{"title" => "I hate it", "value" => 3},
                %{"title" => "I guess", "value" => 4}
              ],
              "vgroup" => "q2"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "qtime",
          "qtitle" => "Total Interview Time",
          "type" => "float",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "qtime",
              "qlabel" => "qtime",
              "qtitle" => "Total Interview Time",
              "row" => nil,
              "rowTitle" => nil,
              "title" => "Total Interview Time",
              "type" => "float",
              "vgroup" => "qtime"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "start_date",
          "qtitle" => "Survey start time",
          "type" => "text",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "start_date",
              "qlabel" => "start_date",
              "qtitle" => "Survey start time",
              "row" => nil,
              "rowTitle" => nil,
              "title" => "Survey start time",
              "type" => "text",
              "vgroup" => "start_date"
            }
          ]
        }
      ],
      "variables" => [
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "record",
          "qlabel" => nil,
          "qtitle" => "Record number",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Record number",
          "type" => "text",
          "vgroup" => "record"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "uuid",
          "qlabel" => nil,
          "qtitle" => "Respondent identifier",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Respondent identifier",
          "type" => "text",
          "vgroup" => "uuid"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "date",
          "qlabel" => nil,
          "qtitle" => "Completion time and date",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Completion time and date",
          "type" => "text",
          "vgroup" => "date"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "markers",
          "qlabel" => nil,
          "qtitle" => "Acquired markers",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Acquired markers",
          "type" => "text",
          "vgroup" => "markers"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "status",
          "qlabel" => "status",
          "qtitle" => "Respondent status",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Respondent status",
          "type" => "single",
          "values" => [
            %{"title" => "Terminated", "value" => 1},
            %{"title" => "Overquota", "value" => 2},
            %{"title" => "Qualified", "value" => 3},
            %{"title" => "Partial", "value" => 4}
          ],
          "vgroup" => "status"
        },
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
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q2",
          "qlabel" => "q2",
          "qtitle" => "Pizza?",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Pizza?",
          "type" => "single",
          "values" => [
            %{"title" => "Yes", "value" => 1},
            %{"title" => "No", "value" => 2},
            %{"title" => "I hate it", "value" => 3},
            %{"title" => "I guess", "value" => 4}
          ],
          "vgroup" => "q2"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "vlist",
          "qlabel" => "vlist",
          "qtitle" => "Sample source",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Sample source",
          "type" => "single",
          "values" => [%{"title" => "Open Survey (list=0)", "value" => 1}],
          "vgroup" => "vlist"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "qtime",
          "qlabel" => "qtime",
          "qtitle" => "Total Interview Time",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Total Interview Time",
          "type" => "float",
          "vgroup" => "qtime"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "vos",
          "qlabel" => "vos",
          "qtitle" => "Operating System",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Operating System",
          "type" => "single",
          "values" => [
            %{"title" => "Windows 95", "value" => 1},
            %{"title" => "Windows 98", "value" => 2},
            %{"title" => "Windows 8", "value" => 3},
            %{"title" => "Windows 10", "value" => 4},
            %{"title" => "Windows 7", "value" => 5},
            %{"title" => "Windows Vista", "value" => 6},
            %{"title" => "Windows 2003", "value" => 7},
            %{"title" => "Windows XP", "value" => 8},
            %{"title" => "Windows 2000", "value" => 9},
            %{"title" => "Microsoft Windows NT 4.0", "value" => 10},
            %{"title" => "Windows ME", "value" => 11},
            %{"title" => "iPhone/iPad", "value" => 12},
            %{"title" => "Mac OS X or older", "value" => 13},
            %{"title" => "Other Mobile", "value" => 14},
            %{"title" => "Linux, UNIX", "value" => 15},
            %{"title" => "Other", "value" => 16}
          ],
          "vgroup" => "vos"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "vosr15oe",
          "qlabel" => "vos",
          "qtitle" => "Operating System",
          "row" => "r15",
          "rowTitle" => "Other",
          "title" => "Operating System - Other",
          "type" => "text",
          "vgroup" => "vosr15oe"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "vbrowser",
          "qlabel" => "vbrowser",
          "qtitle" => "Browser",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Browser",
          "type" => "single",
          "values" => [
            %{"title" => "Opera", "value" => 1},
            %{"title" => "MS Edge", "value" => 2},
            %{"title" => "MSIE 11", "value" => 3},
            %{"title" => "MSIE 10.x", "value" => 4},
            %{"title" => "MSIE 9.x", "value" => 5},
            %{"title" => "MSIE 8.x", "value" => 6},
            %{"title" => "MSIE 7.x", "value" => 7},
            %{"title" => "MSIE 6.x", "value" => 8},
            %{"title" => "MSIE 5.x or older", "value" => 9},
            %{"title" => "Chrome", "value" => 10},
            %{"title" => "Safari", "value" => 11},
            %{"title" => "Firefox", "value" => 12},
            %{"title" => "Other Mozilla or Netscape", "value" => 13},
            %{"title" => "Mobile", "value" => 14},
            %{"title" => "Text Browser", "value" => 15},
            %{"title" => "Other", "value" => 16}
          ],
          "vgroup" => "vbrowser"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "vbrowserr15oe",
          "qlabel" => "vbrowser",
          "qtitle" => "Browser",
          "row" => "r15",
          "rowTitle" => "Other",
          "title" => "Browser - Other",
          "type" => "text",
          "vgroup" => "vbrowserr15oe"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "vmobiledevice",
          "qlabel" => "vmobiledevice",
          "qtitle" => "Mobile device category",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Mobile device category",
          "type" => "single",
          "values" => [
            %{"title" => "Smartphone", "value" => 1},
            %{"title" => "Featurephone", "value" => 2},
            %{"title" => "Tablet", "value" => 3},
            %{"title" => "Other mobile", "value" => 4},
            %{"title" => "Desktop", "value" => 5}
          ],
          "vgroup" => "vmobiledevice"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "vmobileos",
          "qlabel" => "vmobileos",
          "qtitle" => "Mobile OS",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Mobile OS",
          "type" => "single",
          "values" => [
            %{"title" => "iOS", "value" => 1},
            %{"title" => "Android", "value" => 2},
            %{"title" => "Symbian", "value" => 3},
            %{"title" => "Windows Phone", "value" => 4},
            %{"title" => "Blackberry", "value" => 5},
            %{"title" => "Other/Desktop", "value" => 6}
          ],
          "vgroup" => "vmobileos"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "start_date",
          "qlabel" => "start_date",
          "qtitle" => "Survey start time",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Survey start time",
          "type" => "text",
          "vgroup" => "start_date"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "source",
          "qlabel" => nil,
          "qtitle" => "Captured variable",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Captured variable",
          "type" => "text",
          "vgroup" => "source"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "ipAddress",
          "qlabel" => nil,
          "qtitle" => "Captured variable",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Captured variable",
          "type" => "text",
          "vgroup" => "ipAddress"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "decLang",
          "qlabel" => nil,
          "qtitle" => "Captured variable",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Captured variable",
          "type" => "text",
          "vgroup" => "decLang"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "list",
          "qlabel" => nil,
          "qtitle" => "Captured variable",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Captured variable",
          "type" => "text",
          "vgroup" => "list"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "userAgent",
          "qlabel" => nil,
          "qtitle" => "Captured variable",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Captured variable",
          "type" => "text",
          "vgroup" => "userAgent"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "dcua",
          "qlabel" => nil,
          "qtitle" => "Captured variable",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Captured variable",
          "type" => "text",
          "vgroup" => "dcua"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "session",
          "qlabel" => nil,
          "qtitle" => "Captured variable",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Captured variable",
          "type" => "text",
          "vgroup" => "session"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "url",
          "qlabel" => nil,
          "qtitle" => "Captured variable",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Captured variable",
          "type" => "text",
          "vgroup" => "url"
        }
      ]
    }

  end

  def datafeed_complete_false do
    %HTTPoison.Response{
      body: "{\"ack\": \"58adf6c4-80b5-41e6-ae0b-ba902c56facf\", \"errors\": {}, \"results\": [{\"status\": \"3\", \"q1\": \"4444444444\", \"q2\": \"1\", \"uuid\": \"v9er20g6v4wtqx3t\", \"vmobiledevice\": \"5\", \"url\": \"/survey/selfserve/555/survey1\", \"$survey\": \"selfserve/555/survey1\", \"vbrowser\": \"10\", \"qtime\": \"26.13196301465\", \"list\": \"0\", \"dcua\": \"..\", \"markers\": \"qualified\", \"record\": \"1\", \"session\": \"fwgycn85f1vrw03w\", \"vos\": \"13\", \"date\": \"06/04/2018 13:40\", \"userAgent\": \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36\", \"vmobileos\": \"6\", \"ipAddress\": \"198.57.81.230\", \"start_date\": \"06/04/2018 13:40\", \"vlist\": \"1\"}, {\"status\": \"3\", \"q1\": \"5555555555\", \"q2\": \"3\", \"uuid\": \"v2wgz1523zw31kqf\", \"vmobiledevice\": \"5\", \"url\": \"/survey/selfserve/555/survey1\", \"$survey\": \"selfserve/555/survey1\", \"vbrowser\": \"10\", \"qtime\": \"12.493089914322\", \"list\": \"0\", \"dcua\": \"..\", \"markers\": \"qualified\", \"record\": \"2\", \"session\": \"skv6zft8kn1uh3zz\", \"vos\": \"13\", \"date\": \"06/04/2018 13:41\", \"userAgent\": \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36\", \"vmobileos\": \"6\", \"ipAddress\": \"198.57.81.230\", \"start_date\": \"06/04/2018 13:41\", \"vlist\": \"1\"}, {\"status\": \"3\", \"q1\": \"5016664532\", \"q2\": \"4\", \"uuid\": \"6guu10sw23pkzu7d\", \"vmobiledevice\": \"5\", \"url\": \"/survey/selfserve/555/survey1\", \"$survey\": \"selfserve/555/survey1\", \"vbrowser\": \"10\", \"qtime\": \"18.036247014999\", \"list\": \"0\", \"dcua\": \"..\", \"markers\": \"qualified\", \"record\": \"3\", \"session\": \"0m1uhfdm2tcnuuec\", \"vos\": \"13\", \"date\": \"06/04/2018 13:41\", \"userAgent\": \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36\", \"vmobileos\": \"6\", \"ipAddress\": \"198.57.81.230\", \"start_date\": \"06/04/2018 13:41\", \"vlist\": \"1\"}], \"complete\": false}\n",
      headers: [
        {"Date", "Wed, 27 Jun 2018 20:49:46 GMT"},
        {"X-Content-Type-Options", "nosniff"},
        {"Content-Length", "1868"},
        {"x-xss-protection", "1; mode=block"},
        {"Content-Disposition", "attachment"},
        {"Expires", "Thu, 04 Jul 1991 20:49:46 GMT"},
        {"x-Usage-Today", "13 5306"},
        {"X-Trace", "14854 4302"},
        {"Pragma", "no-cache"},
        {"Cache-Control", "no-cache, no-store"},
        {"Content-Type", "application/json"},
        {"Vary", "Accept-Encoding"}
      ],
      request_url: "http://example.decipherinc.com/api/v1/datafeed/all?paths=selfserve/555/survey1",
      status_code: 200
    }
  end

  def datafeed_complete_true do
    %HTTPoison.Response{
      body: "{\"ack\": \"58adf6c4-80b5-41e6-ae0b-ba902c56facf\", \"errors\": {}, \"results\": [{\"status\": \"3\", \"q1\": \"4444444444\", \"q2\": \"1\", \"uuid\": \"v9er20g6v4wtqx3t\", \"vmobiledevice\": \"5\", \"url\": \"/survey/selfserve/555/survey1\", \"$survey\": \"selfserve/555/survey1\", \"vbrowser\": \"10\", \"qtime\": \"26.13196301465\", \"list\": \"0\", \"dcua\": \"..\", \"markers\": \"qualified\", \"record\": \"1\", \"session\": \"fwgycn85f1vrw03w\", \"vos\": \"13\", \"date\": \"06/04/2018 13:40\", \"userAgent\": \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36\", \"vmobileos\": \"6\", \"ipAddress\": \"198.57.81.230\", \"start_date\": \"06/04/2018 13:40\", \"vlist\": \"1\"}, {\"status\": \"3\", \"q1\": \"5555555555\", \"q2\": \"3\", \"uuid\": \"v2wgz1523zw31kqf\", \"vmobiledevice\": \"5\", \"url\": \"/survey/selfserve/555/survey1\", \"$survey\": \"selfserve/555/survey1\", \"vbrowser\": \"10\", \"qtime\": \"12.493089914322\", \"list\": \"0\", \"dcua\": \"..\", \"markers\": \"qualified\", \"record\": \"2\", \"session\": \"skv6zft8kn1uh3zz\", \"vos\": \"13\", \"date\": \"06/04/2018 13:41\", \"userAgent\": \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36\", \"vmobileos\": \"6\", \"ipAddress\": \"198.57.81.230\", \"start_date\": \"06/04/2018 13:41\", \"vlist\": \"1\"}, {\"status\": \"3\", \"q1\": \"5016664532\", \"q2\": \"4\", \"uuid\": \"6guu10sw23pkzu7d\", \"vmobiledevice\": \"5\", \"url\": \"/survey/selfserve/555/survey1\", \"$survey\": \"selfserve/555/survey1\", \"vbrowser\": \"10\", \"qtime\": \"18.036247014999\", \"list\": \"0\", \"dcua\": \"..\", \"markers\": \"qualified\", \"record\": \"3\", \"session\": \"0m1uhfdm2tcnuuec\", \"vos\": \"13\", \"date\": \"06/04/2018 13:41\", \"userAgent\": \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36\", \"vmobileos\": \"6\", \"ipAddress\": \"198.57.81.230\", \"start_date\": \"06/04/2018 13:41\", \"vlist\": \"1\"}], \"complete\": true}\n",
      headers: [
        {"Date", "Wed, 27 Jun 2018 20:49:46 GMT"},
        {"X-Content-Type-Options", "nosniff"},
        {"Content-Length", "1868"},
        {"x-xss-protection", "1; mode=block"},
        {"Content-Disposition", "attachment"},
        {"Expires", "Thu, 04 Jul 1991 20:49:46 GMT"},
        {"x-Usage-Today", "13 5306"},
        {"X-Trace", "14854 4302"},
        {"Pragma", "no-cache"},
        {"Cache-Control", "no-cache, no-store"},
        {"Content-Type", "application/json"},
        {"Vary", "Accept-Encoding"}
      ],
      request_url: "http://example.decipherinc.com/api/v1/datafeed/all?paths=selfserve/555/survey1",
      status_code: 200
    }
  end

  def raw_datamap_response do
    %HTTPoison.Response{
      body: "{\"variables\": [{\"vgroup\": \"record\", \"qtitle\": \"Record number\", \"colTitle\": null, \"title\": \"Record number\", \"rowTitle\": null, \"label\": \"record\", \"row\": null, \"type\": \"text\", \"col\": null, \"qlabel\": null}, {\"vgroup\": \"uuid\", \"qtitle\": \"Respondent identifier\", \"colTitle\": null, \"title\": \"Respondent identifier\", \"rowTitle\": null, \"label\": \"uuid\", \"row\": null, \"type\": \"text\", \"col\": null, \"qlabel\": null}, {\"vgroup\": \"date\", \"qtitle\": \"Completion time and date\", \"colTitle\": null, \"title\": \"Completion time and date\", \"rowTitle\": null, \"label\": \"date\", \"row\": null, \"type\": \"text\", \"col\": null, \"qlabel\": null}, {\"vgroup\": \"markers\", \"qtitle\": \"Acquired markers\", \"colTitle\": null, \"title\": \"Acquired markers\", \"rowTitle\": null, \"label\": \"markers\", \"row\": null, \"type\": \"text\", \"col\": null, \"qlabel\": null}, {\"vgroup\": \"status\", \"qtitle\": \"Respondent status\", \"colTitle\": null, \"title\": \"Respondent status\", \"rowTitle\": null, \"label\": \"status\", \"values\": [{\"value\": 1, \"title\": \"Terminated\"}, {\"value\": 2, \"title\": \"Overquota\"}, {\"value\": 3, \"title\": \"Qualified\"}, {\"value\": 4, \"title\": \"Partial\"}], \"row\": null, \"type\": \"single\", \"col\": null, \"qlabel\": \"status\"}, {\"vgroup\": \"q1\", \"qtitle\": \"What's your number?\", \"colTitle\": null, \"title\": \"What's your number?\", \"rowTitle\": null, \"label\": \"q1\", \"row\": null, \"type\": \"number\", \"col\": null, \"qlabel\": \"q1\"}, {\"vgroup\": \"q2\", \"qtitle\": \"Pizza?\", \"colTitle\": null, \"title\": \"Pizza?\", \"rowTitle\": null, \"label\": \"q2\", \"values\": [{\"value\": 1, \"title\": \"Yes\"}, {\"value\": 2, \"title\": \"No\"}, {\"value\": 3, \"title\": \"I hate it\"}, {\"value\": 4, \"title\": \"I guess\"}], \"row\": null, \"type\": \"single\", \"col\": null, \"qlabel\": \"q2\"}, {\"vgroup\": \"vlist\", \"qtitle\": \"Sample source\", \"colTitle\": null, \"title\": \"Sample source\", \"rowTitle\": null, \"label\": \"vlist\", \"values\": [{\"value\": 1, \"title\": \"Open Survey (list=0)\"}], \"row\": null, \"type\": \"single\", \"col\": null, \"qlabel\": \"vlist\"}, {\"vgroup\": \"qtime\", \"qtitle\": \"Total Interview Time\", \"colTitle\": null, \"title\": \"Total Interview Time\", \"rowTitle\": null, \"label\": \"qtime\", \"row\": null, \"type\": \"float\", \"col\": null, \"qlabel\": \"qtime\"}, {\"vgroup\": \"vos\", \"qtitle\": \"Operating System\", \"colTitle\": null, \"title\": \"Operating System\", \"rowTitle\": null, \"label\": \"vos\", \"values\": [{\"value\": 1, \"title\": \"Windows 95\"}, {\"value\": 2, \"title\": \"Windows 98\"}, {\"value\": 3, \"title\": \"Windows 8\"}, {\"value\": 4, \"title\": \"Windows 10\"}, {\"value\": 5, \"title\": \"Windows 7\"}, {\"value\": 6, \"title\": \"Windows Vista\"}, {\"value\": 7, \"title\": \"Windows 2003\"}, {\"value\": 8, \"title\": \"Windows XP\"}, {\"value\": 9, \"title\": \"Windows 2000\"}, {\"value\": 10, \"title\": \"Microsoft Windows NT 4.0\"}, {\"value\": 11, \"title\": \"Windows ME\"}, {\"value\": 12, \"title\": \"iPhone/iPad\"}, {\"value\": 13, \"title\": \"Mac OS X or older\"}, {\"value\": 14, \"title\": \"Other Mobile\"}, {\"value\": 15, \"title\": \"Linux, UNIX\"}, {\"value\": 16, \"title\": \"Other\"}], \"row\": null, \"type\": \"single\", \"col\": null, \"qlabel\": \"vos\"}, {\"vgroup\": \"vosr15oe\", \"qtitle\": \"Operating System\", \"colTitle\": null, \"title\": \"Operating System - Other\", \"rowTitle\": \"Other\", \"label\": \"vosr15oe\", \"row\": \"r15\", \"type\": \"text\", \"col\": null, \"qlabel\": \"vos\"}, {\"vgroup\": \"vbrowser\", \"qtitle\": \"Browser\", \"colTitle\": null, \"title\": \"Browser\", \"rowTitle\": null, \"label\": \"vbrowser\", \"values\": [{\"value\": 1, \"title\": \"Opera\"}, {\"value\": 2, \"title\": \"MS Edge\"}, {\"value\": 3, \"title\": \"MSIE 11\"}, {\"value\": 4, \"title\": \"MSIE 10.x\"}, {\"value\": 5, \"title\": \"MSIE 9.x\"}, {\"value\": 6, \"title\": \"MSIE 8.x\"}, {\"value\": 7, \"title\": \"MSIE 7.x\"}, {\"value\": 8, \"title\": \"MSIE 6.x\"}, {\"value\": 9, \"title\": \"MSIE 5.x or older\"}, {\"value\": 10, \"title\": \"Chrome\"}, {\"value\": 11, \"title\": \"Safari\"}, {\"value\": 12, \"title\": \"Firefox\"}, {\"value\": 13, \"title\": \"Other Mozilla or Netscape\"}, {\"value\": 14, \"title\": \"Mobile\"}, {\"value\": 15, \"title\": \"Text Browser\"}, {\"value\": 16, \"title\": \"Other\"}], \"row\": null, \"type\": \"single\", \"col\": null, \"qlabel\": \"vbrowser\"}, {\"vgroup\": \"vbrowserr15oe\", \"qtitle\": \"Browser\", \"colTitle\": null, \"title\": \"Browser - Other\", \"rowTitle\": \"Other\", \"label\": \"vbrowserr15oe\", \"row\": \"r15\", \"type\": \"text\", \"col\": null, \"qlabel\": \"vbrowser\"}, {\"vgroup\": \"vmobiledevice\", \"qtitle\": \"Mobile device category\", \"colTitle\": null, \"title\": \"Mobile device category\", \"rowTitle\": null, \"label\": \"vmobiledevice\", \"values\": [{\"value\": 1, \"title\": \"Smartphone\"}, {\"value\": 2, \"title\": \"Featurephone\"}, {\"value\": 3, \"title\": \"Tablet\"}, {\"value\": 4, \"title\": \"Other mobile\"}, {\"value\": 5, \"title\": \"Desktop\"}], \"row\": null, \"type\": \"single\", \"col\": null, \"qlabel\": \"vmobiledevice\"}, {\"vgroup\": \"vmobileos\", \"qtitle\": \"Mobile OS\", \"colTitle\": null, \"title\": \"Mobile OS\", \"rowTitle\": null, \"label\": \"vmobileos\", \"values\": [{\"value\": 1, \"title\": \"iOS\"}, {\"value\": 2, \"title\": \"Android\"}, {\"value\": 3, \"title\": \"Symbian\"}, {\"value\": 4, \"title\": \"Windows Phone\"}, {\"value\": 5, \"title\": \"Blackberry\"}, {\"value\": 6, \"title\": \"Other/Desktop\"}], \"row\": null, \"type\": \"single\", \"col\": null, \"qlabel\": \"vmobileos\"}, {\"vgroup\": \"start_date\", \"qtitle\": \"Survey start time\", \"colTitle\": null, \"title\": \"Survey start time\", \"rowTitle\": null, \"label\": \"start_date\", \"row\": null, \"type\": \"text\", \"col\": null, \"qlabel\": \"start_date\"}, {\"vgroup\": \"source\", \"qtitle\": \"Captured variable\", \"colTitle\": null, \"title\": \"Captured variable\", \"rowTitle\": null, \"label\": \"source\", \"row\": null, \"type\": \"text\", \"col\": null, \"qlabel\": null}, {\"vgroup\": \"ipAddress\", \"qtitle\": \"Captured variable\", \"colTitle\": null, \"title\": \"Captured variable\", \"rowTitle\": null, \"label\": \"ipAddress\", \"row\": null, \"type\": \"text\", \"col\": null, \"qlabel\": null}, {\"vgroup\": \"decLang\", \"qtitle\": \"Captured variable\", \"colTitle\": null, \"title\": \"Captured variable\", \"rowTitle\": null, \"label\": \"decLang\", \"row\": null, \"type\": \"text\", \"col\": null, \"qlabel\": null}, {\"vgroup\": \"list\", \"qtitle\": \"Captured variable\", \"colTitle\": null, \"title\": \"Captured variable\", \"rowTitle\": null, \"label\": \"list\", \"row\": null, \"type\": \"text\", \"col\": null, \"qlabel\": null}, {\"vgroup\": \"userAgent\", \"qtitle\": \"Captured variable\", \"colTitle\": null, \"title\": \"Captured variable\", \"rowTitle\": null, \"label\": \"userAgent\", \"row\": null, \"type\": \"text\", \"col\": null, \"qlabel\": null}, {\"vgroup\": \"dcua\", \"qtitle\": \"Captured variable\", \"colTitle\": null, \"title\": \"Captured variable\", \"rowTitle\": null, \"label\": \"dcua\", \"row\": null, \"type\": \"text\", \"col\": null, \"qlabel\": null}, {\"vgroup\": \"session\", \"qtitle\": \"Captured variable\", \"colTitle\": null, \"title\": \"Captured variable\", \"rowTitle\": null, \"label\": \"session\", \"row\": null, \"type\": \"text\", \"col\": null, \"qlabel\": null}, {\"vgroup\": \"url\", \"qtitle\": \"Captured variable\", \"colTitle\": null, \"title\": \"Captured variable\", \"rowTitle\": null, \"label\": \"url\", \"row\": null, \"type\": \"text\", \"col\": null, \"qlabel\": null}], \"questions\": [{\"variables\": [{\"vgroup\": \"q1\", \"qtitle\": \"What's your number?\", \"colTitle\": null, \"title\": \"What's your number?\", \"rowTitle\": null, \"label\": \"q1\", \"row\": null, \"type\": \"number\", \"col\": null, \"qlabel\": \"q1\"}], \"grouping\": \"rows\", \"type\": \"number\", \"qtitle\": \"What's your number?\", \"qlabel\": \"q1\"}, {\"qtitle\": \"Pizza?\", \"variables\": [{\"vgroup\": \"q2\", \"qtitle\": \"Pizza?\", \"colTitle\": null, \"title\": \"Pizza?\", \"rowTitle\": null, \"label\": \"q2\", \"values\": [{\"value\": 1, \"title\": \"Yes\"}, {\"value\": 2, \"title\": \"No\"}, {\"value\": 3, \"title\": \"I hate it\"}, {\"value\": 4, \"title\": \"I guess\"}], \"row\": null, \"type\": \"single\", \"col\": null, \"qlabel\": \"q2\"}], \"values\": [{\"value\": 1, \"title\": \"Yes\"}, {\"value\": 2, \"title\": \"No\"}, {\"value\": 3, \"title\": \"I hate it\"}, {\"value\": 4, \"title\": \"I guess\"}], \"qlabel\": \"q2\", \"type\": \"single\", \"grouping\": \"cols\"}, {\"variables\": [{\"vgroup\": \"qtime\", \"qtitle\": \"Total Interview Time\", \"colTitle\": null, \"title\": \"Total Interview Time\", \"rowTitle\": null, \"label\": \"qtime\", \"row\": null, \"type\": \"float\", \"col\": null, \"qlabel\": \"qtime\"}], \"grouping\": \"rows\", \"type\": \"float\", \"qtitle\": \"Total Interview Time\", \"qlabel\": \"qtime\"}, {\"variables\": [{\"vgroup\": \"start_date\", \"qtitle\": \"Survey start time\", \"colTitle\": null, \"title\": \"Survey start time\", \"rowTitle\": null, \"label\": \"start_date\", \"row\": null, \"type\": \"text\", \"col\": null, \"qlabel\": \"start_date\"}], \"grouping\": \"rows\", \"type\": \"text\", \"qtitle\": \"Survey start time\", \"qlabel\": \"start_date\"}]}\n",
      headers: [
        {"Date", "Thu, 28 Jun 2018 19:21:12 GMT"},
        {"X-Content-Type-Options", "nosniff"},
        {"Content-Length", "8265"},
        {"x-xss-protection", "1; mode=block"},
        {"Content-Disposition", "attachment"},
        {"Expires", "Fri, 05 Jul 1991 19:21:12 GMT"},
        {"x-Usage-Today", "14 5763"},
        {"X-Trace", "16633 4302"},
        {"Pragma", "no-cache"},
        {"Cache-Control", "no-cache, no-store"},
        {"Content-Type", "application/json"},
        {"Vary", "Accept-Encoding"}
      ],
      request_url: "http://isa.decipherinc.com/api/v1/surveys/selfserve/540/grumble/datamap?format=json",
      status_code: 200
    }
  end

  def datafeed_paginated_concat do
    %DecipherAPI.Datafeed{ack: "58adf6c4-80b5-41e6-ae0b-ba902c56facf", complete?: true, errors: %{}, metadata: %{}, results: [%DecipherAPI.Datafeed.Result{date: ~N[2018-06-04 13:40:00], questions_answers: %{"q1" => "4444444444", "q2" => "1"}, raw_result: %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:40", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "4444444444", "q2" => "1", "qtime" => "26.13196301465", "record" => "1", "session" => "fwgycn85f1vrw03w", "start_date" => "06/04/2018 13:40", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "v9er20g6v4wtqx3t", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, survey_url: "selfserve/555/survey1", uuid: "v9er20g6v4wtqx3t"}, %DecipherAPI.Datafeed.Result{date: ~N[2018-06-04 13:41:00], questions_answers: %{"q1" => "5555555555", "q2" => "3"}, raw_result: %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:41", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "5555555555", "q2" => "3", "qtime" => "12.493089914322", "record" => "2", "session" => "skv6zft8kn1uh3zz", "start_date" => "06/04/2018 13:41", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "v2wgz1523zw31kqf", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, survey_url: "selfserve/555/survey1", uuid: "v2wgz1523zw31kqf"}, %DecipherAPI.Datafeed.Result{date: ~N[2018-06-04 13:41:00], questions_answers: %{"q1" => "5016664532", "q2" => "4"}, raw_result: %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:41", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "5016664532", "q2" => "4", "qtime" => "18.036247014999", "record" => "3", "session" => "0m1uhfdm2tcnuuec", "start_date" => "06/04/2018 13:41", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "6guu10sw23pkzu7d", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, survey_url: "selfserve/555/survey1", uuid: "6guu10sw23pkzu7d"}, %DecipherAPI.Datafeed.Result{date: ~N[2018-06-04 13:40:00], questions_answers: %{"q1" => "4444444444", "q2" => "1"}, raw_result: %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:40", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "4444444444", "q2" => "1", "qtime" => "26.13196301465", "record" => "1", "session" => "fwgycn85f1vrw03w", "start_date" => "06/04/2018 13:40", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "v9er20g6v4wtqx3t", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, survey_url: "selfserve/555/survey1", uuid: "v9er20g6v4wtqx3t"}, %DecipherAPI.Datafeed.Result{date: ~N[2018-06-04 13:41:00], questions_answers: %{"q1" => "5555555555", "q2" => "3"}, raw_result: %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:41", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "5555555555", "q2" => "3", "qtime" => "12.493089914322", "record" => "2", "session" => "skv6zft8kn1uh3zz", "start_date" => "06/04/2018 13:41", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "v2wgz1523zw31kqf", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, survey_url: "selfserve/555/survey1", uuid: "v2wgz1523zw31kqf"}, %DecipherAPI.Datafeed.Result{date: ~N[2018-06-04 13:41:00], questions_answers: %{"q1" => "5016664532", "q2" => "4"}, raw_result: %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:41", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "5016664532", "q2" => "4", "qtime" => "18.036247014999", "record" => "3", "session" => "0m1uhfdm2tcnuuec", "start_date" => "06/04/2018 13:41", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "6guu10sw23pkzu7d", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, survey_url: "selfserve/555/survey1", uuid: "6guu10sw23pkzu7d"}]}
  end

  def reset_datafeed_response do
    %HTTPoison.Response{
      body: "{}\n",
      headers: [
        {"Date", "Wed, 27 Jun 2018 22:07:27 GMT"},
        {"X-Content-Type-Options", "nosniff"},
        {"Content-Length", "3"},
        {"x-xss-protection", "1; mode=block"},
        {"Content-Disposition", "attachment"},
        {"Expires", "Thu, 04 Jul 1991 22:07:27 GMT"},
        {"x-Usage-Today", "21 6576"},
        {"X-Trace", "22581 4302"},
        {"Pragma", "no-cache"},
        {"Cache-Control", "no-cache, no-store"},
        {"Content-Type", "application/json"},
        {"Vary", "Accept-Encoding"},
        {"Connection", "close"}
      ],
      request_url: "http://isa.decipherinc.com/api/v1/datafeed/all?paths=selfserve/540/grumble",
      status_code: 200
    }
  end

  def advance_datafeed_response do
    %HTTPoison.Response{
      body: "{\"ack_valid\": true}\n",
      headers: [
        {"Date", "Wed, 27 Jun 2018 22:05:34 GMT"},
        {"X-Content-Type-Options", "nosniff"},
        {"Content-Length", "20"},
        {"x-xss-protection", "1; mode=block"},
        {"Content-Disposition", "attachment"},
        {"Expires", "Thu, 04 Jul 1991 22:05:34 GMT"},
        {"x-Usage-Today", "19 6567"},
        {"X-Trace", "22581 4302"},
        {"Pragma", "no-cache"},
        {"Cache-Control", "no-cache, no-store"},
        {"Content-Type", "application/json"},
        {"Vary", "Accept-Encoding"}
      ],
      request_url: "http://isa.decipherinc.com/api/v1/datafeed/all/ack",
      status_code: 200
    }
  end

end
