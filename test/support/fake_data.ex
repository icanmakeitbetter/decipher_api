defmodule DecipherAPITest.Support.FakeData do
  alias DecipherAPITest.Support.RawResponse
  alias DecipherAPI.Datafeed.ResultSet.Result
  alias DecipherAPI.Datafeed.ResultSet
  alias DecipherAPI.Datamap.{Question, Variables}
  alias DecipherAPI.Datamap

  def response_status_code(code) do
    %HTTPoison.Response{status_code: code}
  end

  def survey_url do
    "something/444/something"
  end

  def new_result_struct do
    %Result{}
  end

  def raw_question_metadata_map do
    %{"survey_id" => nil, "questions" => [], "variables" => []}
  end

  def new_question_metadata_struct do
    %Datamap{}
  end

  def coerced_question_metadata_struct do
    %Datamap{}
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

  def raw_all_question_datamap_response do
    #
    # To update:
    #
    # curl -H 'x-apikey: API_KEY' \
    #   http://SUB.decipherinc.com/api/v1/surveys/S_ID/datamap?format=json \
    #   > test/support/all_questions_datamap.json
    #

    raw_json =
      "all_questions_datamap.json"
      |> Path.expand(__DIR__)
      |> File.read!
      |> Poison.decode!

    %DecipherAPI.Datamap{
      questions: Map.fetch!(raw_json, "questions"),
      survey_id: "selfserve/540/all_questions",
      variables: Map.fetch!(raw_json, "variables"),
      xml: raw_all_question_xml_response()
    }
  end

  def raw_all_question_xml_response do
    #
    # To update:
    #
    # curl -H 'x-apikey: API_KEY' \
    #   http://SUB.decipherinc.com/api/v1/surveys/S_ID/files/survey.xml \
    #   > test/support/all_questions.xml
    #

    "all_questions.xml"
    |> Path.expand(__DIR__)
    |> File.read!
  end

  def raw_question_map(type \\ "number") do
    %{
      "grouping" => "rows",
      "qlabel" => "q1",
      "qtitle" => "What's your number?",
      "type" => type,
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
      variables: %{
        "q1" => coerced_variables_map()
      }
    }
  end

  def new_question_struct do
    %Question{}
  end

  def http_datafeed_body_map do
    %{"ack" => "58adf6c4-80b5-41e6-ae0b-ba902c56facf", "complete" => true, "errors" => %{}, "results" => [%{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:40", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "4444444444", "q2" => "1", "qtime" => "26.13196301465", "record" => "1", "session" => "fwgycn85f1vrw03w", "start_date" => "06/04/2018 13:40", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "v9er20g6v4wtqx3t", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:41", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "5555555555", "q2" => "3", "qtime" => "12.493089914322", "record" => "2", "session" => "skv6zft8kn1uh3zz", "start_date" => "06/04/2018 13:41", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "v2wgz1523zw31kqf", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:41", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "5016664532", "q2" => "4", "qtime" => "18.036247014999", "record" => "3", "session" => "0m1uhfdm2tcnuuec", "start_date" => "06/04/2018 13:41", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "6guu10sw23pkzu7d", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}]}
  end

  def coerced_datafeed_struct do
    %ResultSet{errors: %{}, ack: "58adf6c4-80b5-41e6-ae0b-ba902c56facf", complete?: false, results: [%Result{date: ~N[2018-06-04 13:40:00], answers: %{"q1" => "4444444444", "q2" => "1"}, raw_result: %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:40", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "4444444444", "q2" => "1", "qtime" => "26.13196301465", "record" => "1", "session" => "fwgycn85f1vrw03w", "start_date" => "06/04/2018 13:40", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "v9er20g6v4wtqx3t", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, survey_url: "selfserve/555/survey1", uuid: "v9er20g6v4wtqx3t"}, %Result{date: ~N[2018-06-04 13:41:00], answers: %{"q1" => "5555555555", "q2" => "3"}, raw_result: %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:41", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "5555555555", "q2" => "3", "qtime" => "12.493089914322", "record" => "2", "session" => "skv6zft8kn1uh3zz", "start_date" => "06/04/2018 13:41", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "v2wgz1523zw31kqf", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, survey_url: "selfserve/555/survey1", uuid: "v2wgz1523zw31kqf"}, %Result{date: ~N[2018-06-04 13:41:00], answers: %{"q1" => "5016664532", "q2" => "4"}, raw_result: %{"$survey" => "selfserve/555/survey1", "date" => "06/04/2018 13:41", "dcua" => "..", "ipAddress" => "198.57.81.230", "list" => "0", "markers" => "qualified", "q1" => "5016664532", "q2" => "4", "qtime" => "18.036247014999", "record" => "3", "session" => "0m1uhfdm2tcnuuec", "start_date" => "06/04/2018 13:41", "status" => "3", "url" => "/survey/selfserve/555/survey1", "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36", "uuid" => "6guu10sw23pkzu7d", "vbrowser" => "10", "vlist" => "1", "vmobiledevice" => "5", "vmobileos" => "6", "vos" => "13"}, survey_url: "selfserve/555/survey1", uuid: "6guu10sw23pkzu7d"}]}
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
    RawResponse.raw_datamap_response()
  end

  def datafeed_paginated_concat do
    %DecipherAPI.Datafeed{scope: "all", survey_id: "something/444/something"}
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
