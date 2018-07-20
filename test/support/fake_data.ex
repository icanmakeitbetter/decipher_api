defmodule DecipherAPITest.Support.FakeData do
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
    %DecipherAPI.Datamap{
      questions: [
        %{
          "grouping" => "cols",
          "qlabel" => "q1",
          "qtitle" => "Do you care about the sky?",
          "type" => "single",
          "values" => [
            %{"title" => "Yes", "value" => 1},
            %{"title" => "No", "value" => 2},
            %{"title" => "Maybe", "value" => 3},
            %{"title" => "No really", "value" => 4}
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q1",
              "qlabel" => "q1",
              "qtitle" => "Do you care about the sky?",
              "row" => nil,
              "rowTitle" => nil,
              "title" => "Do you care about the sky?",
              "type" => "single",
              "values" => [
                %{"title" => "Yes", "value" => 1},
                %{"title" => "No", "value" => 2},
                %{"title" => "Maybe", "value" => 3},
                %{"title" => "No really", "value" => 4}
              ],
              "vgroup" => "q1"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q2",
          "qtitle" => "How do you feel about each snack?",
          "type" => "single",
          "values" => [
            %{"title" => "Dissatisfied&nbsp;", "value" => 1},
            %{"title" => "Meh", "value" => 2},
            %{"title" => "Very Happy", "value" => 3}
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q2r1",
              "qlabel" => "q2",
              "qtitle" => "How do you feel about each snack?",
              "row" => "r1",
              "rowTitle" => "Snickers",
              "title" => "Snickers - How do you feel about each snack?",
              "type" => "single",
              "values" => [
                %{"title" => "Dissatisfied&nbsp;", "value" => 1},
                %{"title" => "Meh", "value" => 2},
                %{"title" => "Very Happy", "value" => 3}
              ],
              "vgroup" => "q2"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q2r2",
              "qlabel" => "q2",
              "qtitle" => "How do you feel about each snack?",
              "row" => "r2",
              "rowTitle" => "Fruit",
              "title" => "Fruit - How do you feel about each snack?",
              "type" => "single",
              "values" => [
                %{"title" => "Dissatisfied&nbsp;", "value" => 1},
                %{"title" => "Meh", "value" => 2},
                %{"title" => "Very Happy", "value" => 3}
              ],
              "vgroup" => "q2"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q2r3",
              "qlabel" => "q2",
              "qtitle" => "How do you feel about each snack?",
              "row" => "r3",
              "rowTitle" => "Scooby Snacks",
              "title" => "Scooby Snacks - How do you feel about each snack?",
              "type" => "single",
              "values" => [
                %{"title" => "Dissatisfied&nbsp;", "value" => 1},
                %{"title" => "Meh", "value" => 2},
                %{"title" => "Very Happy", "value" => 3}
              ],
              "vgroup" => "q2"
            }
          ]
        },
        %{
          "grouping" => "cols",
          "qlabel" => "q3",
          "qtitle" => "Which do you prefer?&nbsp;",
          "type" => "multiple",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q3r1",
              "qlabel" => "q3",
              "qtitle" => "Which do you prefer?&nbsp;",
              "row" => "r1",
              "rowTitle" => "Food",
              "title" => "Food - Which do you prefer?&nbsp;",
              "type" => "multiple",
              "vgroup" => "q3"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q3r2",
              "qlabel" => "q3",
              "qtitle" => "Which do you prefer?&nbsp;",
              "row" => "r2",
              "rowTitle" => "Water",
              "title" => "Water - Which do you prefer?&nbsp;",
              "type" => "multiple",
              "vgroup" => "q3"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q3r3",
              "qlabel" => "q3",
              "qtitle" => "Which do you prefer?&nbsp;",
              "row" => "r3",
              "rowTitle" => "Snacks",
              "title" => "Snacks - Which do you prefer?&nbsp;",
              "type" => "multiple",
              "vgroup" => "q3"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q3r4",
              "qlabel" => "q3",
              "qtitle" => "Which do you prefer?&nbsp;",
              "row" => "r4",
              "rowTitle" => "Air",
              "title" => "Air - Which do you prefer?&nbsp;",
              "type" => "multiple",
              "vgroup" => "q3"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q4",
          "qtitle" => "How do you feel about the following?",
          "type" => "multiple",
          "variables" => [
            %{
              "col" => "c1",
              "colTitle" => "Hate it",
              "label" => "q4r1c1",
              "qlabel" => "q4",
              "qtitle" => "How do you feel about the following?",
              "row" => "r1",
              "rowTitle" => "Wood",
              "title" => "Hate it - Wood - How do you feel about the following?",
              "type" => "multiple",
              "vgroup" => "q4r1"
            },
            %{
              "col" => "c2",
              "colTitle" => "Don't care one way or the other",
              "label" => "q4r1c2",
              "qlabel" => "q4",
              "qtitle" => "How do you feel about the following?",
              "row" => "r1",
              "rowTitle" => "Wood",
              "title" => "Don't care one way or the other - Wood - How do you feel about the following?",
              "type" => "multiple",
              "vgroup" => "q4r1"
            },
            %{
              "col" => "c3",
              "colTitle" => "Love it",
              "label" => "q4r1c3",
              "qlabel" => "q4",
              "qtitle" => "How do you feel about the following?",
              "row" => "r1",
              "rowTitle" => "Wood",
              "title" => "Love it - Wood - How do you feel about the following?",
              "type" => "multiple",
              "vgroup" => "q4r1"
            },
            %{
              "col" => "c1",
              "colTitle" => "Hate it",
              "label" => "q4r2c1",
              "qlabel" => "q4",
              "qtitle" => "How do you feel about the following?",
              "row" => "r2",
              "rowTitle" => "Water",
              "title" => "Hate it - Water - How do you feel about the following?",
              "type" => "multiple",
              "vgroup" => "q4r2"
            },
            %{
              "col" => "c2",
              "colTitle" => "Don't care one way or the other",
              "label" => "q4r2c2",
              "qlabel" => "q4",
              "qtitle" => "How do you feel about the following?",
              "row" => "r2",
              "rowTitle" => "Water",
              "title" => "Don't care one way or the other - Water - How do you feel about the following?",
              "type" => "multiple",
              "vgroup" => "q4r2"
            },
            %{
              "col" => "c3",
              "colTitle" => "Love it",
              "label" => "q4r2c3",
              "qlabel" => "q4",
              "qtitle" => "How do you feel about the following?",
              "row" => "r2",
              "rowTitle" => "Water",
              "title" => "Love it - Water - How do you feel about the following?",
              "type" => "multiple",
              "vgroup" => "q4r2"
            },
            %{
              "col" => "c1",
              "colTitle" => "Hate it",
              "label" => "q4r3c1",
              "qlabel" => "q4",
              "qtitle" => "How do you feel about the following?",
              "row" => "r3",
              "rowTitle" => "Dirt",
              "title" => "Hate it - Dirt - How do you feel about the following?",
              "type" => "multiple",
              "vgroup" => "q4r3"
            },
            %{
              "col" => "c2",
              "colTitle" => "Don't care one way or the other",
              "label" => "q4r3c2",
              "qlabel" => "q4",
              "qtitle" => "How do you feel about the following?",
              "row" => "r3",
              "rowTitle" => "Dirt",
              "title" => "Don't care one way or the other - Dirt - How do you feel about the following?",
              "type" => "multiple",
              "vgroup" => "q4r3"
            },
            %{
              "col" => "c3",
              "colTitle" => "Love it",
              "label" => "q4r3c3",
              "qlabel" => "q4",
              "qtitle" => "How do you feel about the following?",
              "row" => "r3",
              "rowTitle" => "Dirt",
              "title" => "Love it - Dirt - How do you feel about the following?",
              "type" => "multiple",
              "vgroup" => "q4r3"
            },
            %{
              "col" => "c1",
              "colTitle" => "Hate it",
              "label" => "q4r4c1",
              "qlabel" => "q4",
              "qtitle" => "How do you feel about the following?",
              "row" => "r4",
              "rowTitle" => "Earth",
              "title" => "Hate it - Earth - How do you feel about the following?",
              "type" => "multiple",
              "vgroup" => "q4r4"
            },
            %{
              "col" => "c2",
              "colTitle" => "Don't care one way or the other",
              "label" => "q4r4c2",
              "qlabel" => "q4",
              "qtitle" => "How do you feel about the following?",
              "row" => "r4",
              "rowTitle" => "Earth",
              "title" => "Don't care one way or the other - Earth - How do you feel about the following?",
              "type" => "multiple",
              "vgroup" => "q4r4"
            },
            %{
              "col" => "c3",
              "colTitle" => "Love it",
              "label" => "q4r4c3",
              "qlabel" => "q4",
              "qtitle" => "How do you feel about the following?",
              "row" => "r4",
              "rowTitle" => "Earth",
              "title" => "Love it - Earth - How do you feel about the following?",
              "type" => "multiple",
              "vgroup" => "q4r4"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q5",
          "qtitle" => "What's your fav brand?",
          "type" => "single",
          "values" => [
            %{"title" => "Ford", "value" => 1},
            %{"title" => "Apple", "value" => 2},
            %{"title" => "Chevy", "value" => 3}
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q5",
              "qlabel" => "q5",
              "qtitle" => "What's your fav brand?",
              "row" => nil,
              "rowTitle" => nil,
              "title" => "What's your fav brand?",
              "type" => "single",
              "values" => [
                %{"title" => "Ford", "value" => 1},
                %{"title" => "Apple", "value" => 2},
                %{"title" => "Chevy", "value" => 3}
              ],
              "vgroup" => "q5"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q6",
          "qtitle" => "Rate each category in each brand",
          "type" => "single",
          "values" => [
            %{"title" => "Don't Like", "value" => 1},
            %{"title" => "Eh", "value" => 2},
            %{"title" => "Much Yes", "value" => 3}
          ],
          "variables" => [
            %{
              "col" => "c1",
              "colTitle" => "Vans",
              "label" => "q6r1c1",
              "qlabel" => "q6",
              "qtitle" => "Rate each category in each brand",
              "row" => "r1",
              "rowTitle" => "Ford",
              "title" => "Vans - Ford - Rate each category in each brand",
              "type" => "single",
              "values" => [
                %{"title" => "Don't Like", "value" => 1},
                %{"title" => "Eh", "value" => 2},
                %{"title" => "Much Yes", "value" => 3}
              ],
              "vgroup" => "q6r1"
            },
            %{
              "col" => "c2",
              "colTitle" => "SUVs",
              "label" => "q6r1c2",
              "qlabel" => "q6",
              "qtitle" => "Rate each category in each brand",
              "row" => "r1",
              "rowTitle" => "Ford",
              "title" => "SUVs - Ford - Rate each category in each brand",
              "type" => "single",
              "values" => [
                %{"title" => "Don't Like", "value" => 1},
                %{"title" => "Eh", "value" => 2},
                %{"title" => "Much Yes", "value" => 3}
              ],
              "vgroup" => "q6r1"
            },
            %{
              "col" => "c3",
              "colTitle" => "Cars",
              "label" => "q6r1c3",
              "qlabel" => "q6",
              "qtitle" => "Rate each category in each brand",
              "row" => "r1",
              "rowTitle" => "Ford",
              "title" => "Cars - Ford - Rate each category in each brand",
              "type" => "single",
              "values" => [
                %{"title" => "Don't Like", "value" => 1},
                %{"title" => "Eh", "value" => 2},
                %{"title" => "Much Yes", "value" => 3}
              ],
              "vgroup" => "q6r1"
            },
            %{
              "col" => "c1",
              "colTitle" => "Vans",
              "label" => "q6r2c1",
              "qlabel" => "q6",
              "qtitle" => "Rate each category in each brand",
              "row" => "r2",
              "rowTitle" => "Chevy",
              "title" => "Vans - Chevy - Rate each category in each brand",
              "type" => "single",
              "values" => [
                %{"title" => "Don't Like", "value" => 1},
                %{"title" => "Eh", "value" => 2},
                %{"title" => "Much Yes", "value" => 3}
              ],
              "vgroup" => "q6r2"
            },
            %{
              "col" => "c2",
              "colTitle" => "SUVs",
              "label" => "q6r2c2",
              "qlabel" => "q6",
              "qtitle" => "Rate each category in each brand",
              "row" => "r2",
              "rowTitle" => "Chevy",
              "title" => "SUVs - Chevy - Rate each category in each brand",
              "type" => "single",
              "values" => [
                %{"title" => "Don't Like", "value" => 1},
                %{"title" => "Eh", "value" => 2},
                %{"title" => "Much Yes", "value" => 3}
              ],
              "vgroup" => "q6r2"
            },
            %{
              "col" => "c3",
              "colTitle" => "Cars",
              "label" => "q6r2c3",
              "qlabel" => "q6",
              "qtitle" => "Rate each category in each brand",
              "row" => "r2",
              "rowTitle" => "Chevy",
              "title" => "Cars - Chevy - Rate each category in each brand",
              "type" => "single",
              "values" => [
                %{"title" => "Don't Like", "value" => 1},
                %{"title" => "Eh", "value" => 2},
                %{"title" => "Much Yes", "value" => 3}
              ],
              "vgroup" => "q6r2"
            },
            %{
              "col" => "c1",
              "colTitle" => "Vans",
              "label" => "q6r3c1",
              "qlabel" => "q6",
              "qtitle" => "Rate each category in each brand",
              "row" => "r3",
              "rowTitle" => "Porche",
              "title" => "Vans - Porche - Rate each category in each brand",
              "type" => "single",
              "values" => [
                %{"title" => "Don't Like", "value" => 1},
                %{"title" => "Eh", "value" => 2},
                %{"title" => "Much Yes", "value" => 3}
              ],
              "vgroup" => "q6r3"
            },
            %{
              "col" => "c2",
              "colTitle" => "SUVs",
              "label" => "q6r3c2",
              "qlabel" => "q6",
              "qtitle" => "Rate each category in each brand",
              "row" => "r3",
              "rowTitle" => "Porche",
              "title" => "SUVs - Porche - Rate each category in each brand",
              "type" => "single",
              "values" => [
                %{"title" => "Don't Like", "value" => 1},
                %{"title" => "Eh", "value" => 2},
                %{"title" => "Much Yes", "value" => 3}
              ],
              "vgroup" => "q6r3"
            },
            %{
              "col" => "c3",
              "colTitle" => "Cars",
              "label" => "q6r3c3",
              "qlabel" => "q6",
              "qtitle" => "Rate each category in each brand",
              "row" => "r3",
              "rowTitle" => "Porche",
              "title" => "Cars - Porche - Rate each category in each brand",
              "type" => "single",
              "values" => [
                %{"title" => "Don't Like", "value" => 1},
                %{"title" => "Eh", "value" => 2},
                %{"title" => "Much Yes", "value" => 3}
              ],
              "vgroup" => "q6r3"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q7",
          "qtitle" => "What's your phone number?",
          "type" => "number",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q7",
              "qlabel" => "q7",
              "qtitle" => "What's your phone number?",
              "row" => nil,
              "rowTitle" => nil,
              "title" => "What's your phone number?",
              "type" => "number",
              "vgroup" => "q7"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q8",
          "qtitle" => "What's your email?",
          "type" => "text",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q8",
              "qlabel" => "q8",
              "qtitle" => "What's your email?",
              "row" => nil,
              "rowTitle" => nil,
              "title" => "What's your email?",
              "type" => "text",
              "vgroup" => "q8"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q9",
          "qtitle" => "What does life mean to you?",
          "type" => "text",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q9",
              "qlabel" => "q9",
              "qtitle" => "What does life mean to you?",
              "row" => nil,
              "rowTitle" => nil,
              "title" => "What does life mean to you?",
              "type" => "text",
              "vgroup" => "q9"
            }
          ]
        },
        %{
          "grouping" => "cols",
          "qlabel" => "q10",
          "qtitle" => "Monthly spending of cheese and wine",
          "type" => "number",
          "variables" => [
            %{
              "col" => "c1",
              "colTitle" => "Cheese",
              "label" => "q10r1c1",
              "qlabel" => "q10",
              "qtitle" => "Monthly spending of cheese and wine",
              "row" => "r1",
              "rowTitle" => "May",
              "title" => "May - Cheese - Monthly spending of cheese and wine",
              "type" => "number",
              "vgroup" => "q10c1"
            },
            %{
              "col" => "c1",
              "colTitle" => "Cheese",
              "label" => "q10r2c1",
              "qlabel" => "q10",
              "qtitle" => "Monthly spending of cheese and wine",
              "row" => "r2",
              "rowTitle" => "June",
              "title" => "June - Cheese - Monthly spending of cheese and wine",
              "type" => "number",
              "vgroup" => "q10c1"
            },
            %{
              "col" => "c1",
              "colTitle" => "Cheese",
              "label" => "q10r3c1",
              "qlabel" => "q10",
              "qtitle" => "Monthly spending of cheese and wine",
              "row" => "r3",
              "rowTitle" => "July",
              "title" => "July - Cheese - Monthly spending of cheese and wine",
              "type" => "number",
              "vgroup" => "q10c1"
            },
            %{
              "col" => "c2",
              "colTitle" => "Wine",
              "label" => "q10r1c2",
              "qlabel" => "q10",
              "qtitle" => "Monthly spending of cheese and wine",
              "row" => "r1",
              "rowTitle" => "May",
              "title" => "May - Wine - Monthly spending of cheese and wine",
              "type" => "number",
              "vgroup" => "q10c2"
            },
            %{
              "col" => "c2",
              "colTitle" => "Wine",
              "label" => "q10r2c2",
              "qlabel" => "q10",
              "qtitle" => "Monthly spending of cheese and wine",
              "row" => "r2",
              "rowTitle" => "June",
              "title" => "June - Wine - Monthly spending of cheese and wine",
              "type" => "number",
              "vgroup" => "q10c2"
            },
            %{
              "col" => "c2",
              "colTitle" => "Wine",
              "label" => "q10r3c2",
              "qlabel" => "q10",
              "qtitle" => "Monthly spending of cheese and wine",
              "row" => "r3",
              "rowTitle" => "July",
              "title" => "July - Wine - Monthly spending of cheese and wine",
              "type" => "number",
              "vgroup" => "q10c2"
            }
          ]
        },
        %{
          "grouping" => "cols",
          "qlabel" => "q13",
          "qtitle" => "Rate your stay at diff hotels.",
          "type" => "number",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q13r1",
              "qlabel" => "q13",
              "qtitle" => "Rate your stay at diff hotels.",
              "row" => "r1",
              "rowTitle" => "Hilton",
              "title" => "Hilton - Rate your stay at diff hotels.",
              "type" => "number",
              "vgroup" => "q13"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q13r2",
              "qlabel" => "q13",
              "qtitle" => "Rate your stay at diff hotels.",
              "row" => "r2",
              "rowTitle" => "Mariot",
              "title" => "Mariot - Rate your stay at diff hotels.",
              "type" => "number",
              "vgroup" => "q13"
            }
          ]
        },
        %{
          "grouping" => "cols",
          "qlabel" => "q14",
          "qtitle" => "New Button Single Select Question",
          "type" => "single",
          "values" => [
            %{"title" => "Example r1", "value" => 1},
            %{"title" => "Example r2", "value" => 2},
            %{"title" => "Example r3", "value" => 3}
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q14",
              "qlabel" => "q14",
              "qtitle" => "New Button Single Select Question",
              "row" => nil,
              "rowTitle" => nil,
              "title" => "New Button Single Select Question",
              "type" => "single",
              "values" => [
                %{"title" => "Example r1", "value" => 1},
                %{"title" => "Example r2", "value" => 2},
                %{"title" => "Example r3", "value" => 3}
              ],
              "vgroup" => "q14"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q15",
          "qtitle" => "Do you like or hate the following?",
          "type" => "single",
          "values" => [
            %{"title" => "Hate", "value" => 1},
            %{"title" => "Like", "value" => 2}
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q15r1",
              "qlabel" => "q15",
              "qtitle" => "Do you like or hate the following?",
              "row" => "r1",
              "rowTitle" => "Air",
              "title" => "Air - Do you like or hate the following?",
              "type" => "single",
              "values" => [
                %{"title" => "Hate", "value" => 1},
                %{"title" => "Like", "value" => 2}
              ],
              "vgroup" => "q15"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q15r2",
              "qlabel" => "q15",
              "qtitle" => "Do you like or hate the following?",
              "row" => "r2",
              "rowTitle" => "Water",
              "title" => "Water - Do you like or hate the following?",
              "type" => "single",
              "values" => [
                %{"title" => "Hate", "value" => 1},
                %{"title" => "Like", "value" => 2}
              ],
              "vgroup" => "q15"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q15r3",
              "qlabel" => "q15",
              "qtitle" => "Do you like or hate the following?",
              "row" => "r3",
              "rowTitle" => "Fire",
              "title" => "Fire - Do you like or hate the following?",
              "type" => "single",
              "values" => [
                %{"title" => "Hate", "value" => 1},
                %{"title" => "Like", "value" => 2}
              ],
              "vgroup" => "q15"
            }
          ]
        },
        %{
          "grouping" => "cols",
          "qlabel" => "q33",
          "qtitle" => "Choose your preferred living space.",
          "type" => "multiple",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q33r1",
              "qlabel" => "q33",
              "qtitle" => "Choose your preferred living space.",
              "row" => "r1",
              "rowTitle" => "Apt",
              "title" => "Apt - Choose your preferred living space.",
              "type" => "multiple",
              "vgroup" => "q33"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q33r2",
              "qlabel" => "q33",
              "qtitle" => "Choose your preferred living space.",
              "row" => "r2",
              "rowTitle" => "House",
              "title" => "House - Choose your preferred living space.",
              "type" => "multiple",
              "vgroup" => "q33"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q33r3",
              "qlabel" => "q33",
              "qtitle" => "Choose your preferred living space.",
              "row" => "r3",
              "rowTitle" => "Box",
              "title" => "Box - Choose your preferred living space.",
              "type" => "multiple",
              "vgroup" => "q33"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q33r4",
              "qlabel" => "q33",
              "qtitle" => "Choose your preferred living space.",
              "row" => "r4",
              "rowTitle" => "Car",
              "title" => "Car - Choose your preferred living space.",
              "type" => "multiple",
              "vgroup" => "q33"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q33r5",
              "qlabel" => "q33",
              "qtitle" => "Choose your preferred living space.",
              "row" => "r5",
              "rowTitle" => "RV",
              "title" => "RV - Choose your preferred living space.",
              "type" => "multiple",
              "vgroup" => "q33"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q33r6",
              "qlabel" => "q33",
              "qtitle" => "Choose your preferred living space.",
              "row" => "r6",
              "rowTitle" => "Tent",
              "title" => "Tent - Choose your preferred living space.",
              "type" => "multiple",
              "vgroup" => "q33"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q34",
          "qtitle" => "Choose the places you'd like to live.",
          "type" => "multiple",
          "variables" => [
            %{
              "col" => "c1",
              "colTitle" => "vans",
              "label" => "q34r1c1",
              "qlabel" => "q34",
              "qtitle" => "Choose the places you'd like to live.",
              "row" => "r1",
              "rowTitle" => "Ford",
              "title" => "vans - Ford - Choose the places you'd like to live.",
              "type" => "multiple",
              "vgroup" => "q34r1"
            },
            %{
              "col" => "c2",
              "colTitle" => "cars",
              "label" => "q34r1c2",
              "qlabel" => "q34",
              "qtitle" => "Choose the places you'd like to live.",
              "row" => "r1",
              "rowTitle" => "Ford",
              "title" => "cars - Ford - Choose the places you'd like to live.",
              "type" => "multiple",
              "vgroup" => "q34r1"
            },
            %{
              "col" => "c3",
              "colTitle" => "suvs",
              "label" => "q34r1c3",
              "qlabel" => "q34",
              "qtitle" => "Choose the places you'd like to live.",
              "row" => "r1",
              "rowTitle" => "Ford",
              "title" => "suvs - Ford - Choose the places you'd like to live.",
              "type" => "multiple",
              "vgroup" => "q34r1"
            },
            %{
              "col" => "c1",
              "colTitle" => "vans",
              "label" => "q34r2c1",
              "qlabel" => "q34",
              "qtitle" => "Choose the places you'd like to live.",
              "row" => "r2",
              "rowTitle" => "Chevy",
              "title" => "vans - Chevy - Choose the places you'd like to live.",
              "type" => "multiple",
              "vgroup" => "q34r2"
            },
            %{
              "col" => "c2",
              "colTitle" => "cars",
              "label" => "q34r2c2",
              "qlabel" => "q34",
              "qtitle" => "Choose the places you'd like to live.",
              "row" => "r2",
              "rowTitle" => "Chevy",
              "title" => "cars - Chevy - Choose the places you'd like to live.",
              "type" => "multiple",
              "vgroup" => "q34r2"
            },
            %{
              "col" => "c3",
              "colTitle" => "suvs",
              "label" => "q34r2c3",
              "qlabel" => "q34",
              "qtitle" => "Choose the places you'd like to live.",
              "row" => "r2",
              "rowTitle" => "Chevy",
              "title" => "suvs - Chevy - Choose the places you'd like to live.",
              "type" => "multiple",
              "vgroup" => "q34r2"
            },
            %{
              "col" => "c1",
              "colTitle" => "vans",
              "label" => "q34r3c1",
              "qlabel" => "q34",
              "qtitle" => "Choose the places you'd like to live.",
              "row" => "r3",
              "rowTitle" => "Lotus",
              "title" => "vans - Lotus - Choose the places you'd like to live.",
              "type" => "multiple",
              "vgroup" => "q34r3"
            },
            %{
              "col" => "c2",
              "colTitle" => "cars",
              "label" => "q34r3c2",
              "qlabel" => "q34",
              "qtitle" => "Choose the places you'd like to live.",
              "row" => "r3",
              "rowTitle" => "Lotus",
              "title" => "cars - Lotus - Choose the places you'd like to live.",
              "type" => "multiple",
              "vgroup" => "q34r3"
            },
            %{
              "col" => "c3",
              "colTitle" => "suvs",
              "label" => "q34r3c3",
              "qlabel" => "q34",
              "qtitle" => "Choose the places you'd like to live.",
              "row" => "r3",
              "rowTitle" => "Lotus",
              "title" => "suvs - Lotus - Choose the places you'd like to live.",
              "type" => "multiple",
              "vgroup" => "q34r3"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q16",
          "qtitle" => "Rate these things",
          "type" => "single",
          "values" => [
            %{"title" => "Hate&nbsp;❌", "value" => 1},
            %{"title" => "Meh&nbsp;🤷🏻‍♂️", "value" => 2},
            %{"title" => "Love&nbsp;❤️", "value" => 3}
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q16r1",
              "qlabel" => "q16",
              "qtitle" => "Rate these things",
              "row" => "r1",
              "rowTitle" => "Chevy",
              "title" => "Chevy - Rate these things",
              "type" => "single",
              "values" => [
                %{"title" => "Hate&nbsp;❌", "value" => 1},
                %{"title" => "Meh&nbsp;🤷🏻‍♂️", "value" => 2},
                %{"title" => "Love&nbsp;❤️", "value" => 3}
              ],
              "vgroup" => "q16"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q16r2",
              "qlabel" => "q16",
              "qtitle" => "Rate these things",
              "row" => "r2",
              "rowTitle" => "Ford",
              "title" => "Ford - Rate these things",
              "type" => "single",
              "values" => [
                %{"title" => "Hate&nbsp;❌", "value" => 1},
                %{"title" => "Meh&nbsp;🤷🏻‍♂️", "value" => 2},
                %{"title" => "Love&nbsp;❤️", "value" => 3}
              ],
              "vgroup" => "q16"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q16r3",
              "qlabel" => "q16",
              "qtitle" => "Rate these things",
              "row" => "r3",
              "rowTitle" => "Porche",
              "title" => "Porche - Rate these things",
              "type" => "single",
              "values" => [
                %{"title" => "Hate&nbsp;❌", "value" => 1},
                %{"title" => "Meh&nbsp;🤷🏻‍♂️", "value" => 2},
                %{"title" => "Love&nbsp;❤️", "value" => 3}
              ],
              "vgroup" => "q16"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q16r4",
              "qlabel" => "q16",
              "qtitle" => "Rate these things",
              "row" => "r4",
              "rowTitle" => "Lotus",
              "title" => "Lotus - Rate these things",
              "type" => "single",
              "values" => [
                %{"title" => "Hate&nbsp;❌", "value" => 1},
                %{"title" => "Meh&nbsp;🤷🏻‍♂️", "value" => 2},
                %{"title" => "Love&nbsp;❤️", "value" => 3}
              ],
              "vgroup" => "q16"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q16r5",
              "qlabel" => "q16",
              "qtitle" => "Rate these things",
              "row" => "r5",
              "rowTitle" => "Packer",
              "title" => "Packer - Rate these things",
              "type" => "single",
              "values" => [
                %{"title" => "Hate&nbsp;❌", "value" => 1},
                %{"title" => "Meh&nbsp;🤷🏻‍♂️", "value" => 2},
                %{"title" => "Love&nbsp;❤️", "value" => 3}
              ],
              "vgroup" => "q16"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q20",
          "qtitle" => "Rate these, okay?",
          "type" => "single",
          "values" => [
            %{"title" => "death&nbsp;☠️", "value" => 1},
            %{"title" => "vomit 🤮", "value" => 2},
            %{"title" => "heart&nbsp;❤️", "value" => 3}
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q20r1",
              "qlabel" => "q20",
              "qtitle" => "Rate these, okay?",
              "row" => "r1",
              "rowTitle" => "Cars",
              "title" => "Cars - Rate these, okay?",
              "type" => "single",
              "values" => [
                %{"title" => "death&nbsp;☠️", "value" => 1},
                %{"title" => "vomit 🤮", "value" => 2},
                %{"title" => "heart&nbsp;❤️", "value" => 3}
              ],
              "vgroup" => "q20"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q20r2",
              "qlabel" => "q20",
              "qtitle" => "Rate these, okay?",
              "row" => "r2",
              "rowTitle" => "Bikes",
              "title" => "Bikes - Rate these, okay?",
              "type" => "single",
              "values" => [
                %{"title" => "death&nbsp;☠️", "value" => 1},
                %{"title" => "vomit 🤮", "value" => 2},
                %{"title" => "heart&nbsp;❤️", "value" => 3}
              ],
              "vgroup" => "q20"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q20r3",
              "qlabel" => "q20",
              "qtitle" => "Rate these, okay?",
              "row" => "r3",
              "rowTitle" => "Trucks",
              "title" => "Trucks - Rate these, okay?",
              "type" => "single",
              "values" => [
                %{"title" => "death&nbsp;☠️", "value" => 1},
                %{"title" => "vomit 🤮", "value" => 2},
                %{"title" => "heart&nbsp;❤️", "value" => 3}
              ],
              "vgroup" => "q20"
            }
          ]
        },
        %{
          "grouping" => "cols",
          "qlabel" => "q22",
          "qtitle" => "What would you rate these movies?",
          "type" => "single",
          "values" => [
            %{"title" => "Star 1", "value" => 1},
            %{"title" => "Star 2", "value" => 2},
            %{"title" => "Star 3", "value" => 3},
            %{"title" => "Star 4", "value" => 4},
            %{"title" => "Star 5", "value" => 5}
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q22r1",
              "qlabel" => "q22",
              "qtitle" => "What would you rate these movies?",
              "row" => "r1",
              "rowTitle" => "Back to the Future 2",
              "title" => "Back to the Future 2 - What would you rate these movies?",
              "type" => "single",
              "values" => [
                %{"title" => "Star 1", "value" => 1},
                %{"title" => "Star 2", "value" => 2},
                %{"title" => "Star 3", "value" => 3},
                %{"title" => "Star 4", "value" => 4},
                %{"title" => "Star 5", "value" => 5}
              ],
              "vgroup" => "q22"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q22r2",
              "qlabel" => "q22",
              "qtitle" => "What would you rate these movies?",
              "row" => "r2",
              "rowTitle" => "Back to the Future 3",
              "title" => "Back to the Future 3 - What would you rate these movies?",
              "type" => "single",
              "values" => [
                %{"title" => "Star 1", "value" => 1},
                %{"title" => "Star 2", "value" => 2},
                %{"title" => "Star 3", "value" => 3},
                %{"title" => "Star 4", "value" => 4},
                %{"title" => "Star 5", "value" => 5}
              ],
              "vgroup" => "q22"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q22r3",
              "qlabel" => "q22",
              "qtitle" => "What would you rate these movies?",
              "row" => "r3",
              "rowTitle" => "Jurassic Park",
              "title" => "Jurassic Park - What would you rate these movies?",
              "type" => "single",
              "values" => [
                %{"title" => "Star 1", "value" => 1},
                %{"title" => "Star 2", "value" => 2},
                %{"title" => "Star 3", "value" => 3},
                %{"title" => "Star 4", "value" => 4},
                %{"title" => "Star 5", "value" => 5}
              ],
              "vgroup" => "q22"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q23",
          "qtitle" => "New Shopping Cart Question",
          "type" => "text",
          "variables" => [
            %{
              "col" => "c1",
              "colTitle" => "Quantity",
              "label" => "q23r1c1",
              "qlabel" => "q23",
              "qtitle" => "New Shopping Cart Question",
              "row" => "r1",
              "rowTitle" => "[Software ™ Standard © Edition] Upload Image",
              "title" => "Quantity - [Software ™ Standard © Edition] Upload Image - New Shopping Cart Question",
              "type" => "text",
              "vgroup" => "q23r1"
            },
            %{
              "col" => "c2",
              "colTitle" => "Click Order",
              "label" => "q23r1c2",
              "qlabel" => "q23",
              "qtitle" => "New Shopping Cart Question",
              "row" => "r1",
              "rowTitle" => "[Software ™ Standard © Edition] Upload Image",
              "title" => "Click Order - [Software ™ Standard © Edition] Upload Image - New Shopping Cart Question",
              "type" => "text",
              "vgroup" => "q23r1"
            },
            %{
              "col" => "c3",
              "colTitle" => "Seconds Viewed",
              "label" => "q23r1c3",
              "qlabel" => "q23",
              "qtitle" => "New Shopping Cart Question",
              "row" => "r1",
              "rowTitle" => "[Software ™ Standard © Edition] Upload Image",
              "title" => "Seconds Viewed - [Software ™ Standard © Edition] Upload Image - New Shopping Cart Question",
              "type" => "text",
              "vgroup" => "q23r1"
            },
            %{
              "col" => "c1",
              "colTitle" => "Quantity",
              "label" => "q23r2c1",
              "qlabel" => "q23",
              "qtitle" => "New Shopping Cart Question",
              "row" => "r2",
              "rowTitle" => "[Software ™ Enhanced © Edition] Upload Image",
              "title" => "Quantity - [Software ™ Enhanced © Edition] Upload Image - New Shopping Cart Question",
              "type" => "text",
              "vgroup" => "q23r2"
            },
            %{
              "col" => "c2",
              "colTitle" => "Click Order",
              "label" => "q23r2c2",
              "qlabel" => "q23",
              "qtitle" => "New Shopping Cart Question",
              "row" => "r2",
              "rowTitle" => "[Software ™ Enhanced © Edition] Upload Image",
              "title" => "Click Order - [Software ™ Enhanced © Edition] Upload Image - New Shopping Cart Question",
              "type" => "text",
              "vgroup" => "q23r2"
            },
            %{
              "col" => "c3",
              "colTitle" => "Seconds Viewed",
              "label" => "q23r2c3",
              "qlabel" => "q23",
              "qtitle" => "New Shopping Cart Question",
              "row" => "r2",
              "rowTitle" => "[Software ™ Enhanced © Edition] Upload Image",
              "title" => "Seconds Viewed - [Software ™ Enhanced © Edition] Upload Image - New Shopping Cart Question",
              "type" => "text",
              "vgroup" => "q23r2"
            },
            %{
              "col" => "c1",
              "colTitle" => "Quantity",
              "label" => "q23r3c1",
              "qlabel" => "q23",
              "qtitle" => "New Shopping Cart Question",
              "row" => "r3",
              "rowTitle" => "[Software ™ Professional © Edition] Upload Image",
              "title" => "Quantity - [Software ™ Professional © Edition] Upload Image - New Shopping Cart Question",
              "type" => "text",
              "vgroup" => "q23r3"
            },
            %{
              "col" => "c2",
              "colTitle" => "Click Order",
              "label" => "q23r3c2",
              "qlabel" => "q23",
              "qtitle" => "New Shopping Cart Question",
              "row" => "r3",
              "rowTitle" => "[Software ™ Professional © Edition] Upload Image",
              "title" => "Click Order - [Software ™ Professional © Edition] Upload Image - New Shopping Cart Question",
              "type" => "text",
              "vgroup" => "q23r3"
            },
            %{
              "col" => "c3",
              "colTitle" => "Seconds Viewed",
              "label" => "q23r3c3",
              "qlabel" => "q23",
              "qtitle" => "New Shopping Cart Question",
              "row" => "r3",
              "rowTitle" => "[Software ™ Professional © Edition] Upload Image",
              "title" => "Seconds Viewed - [Software ™ Professional © Edition] Upload Image - New Shopping Cart Question",
              "type" => "text",
              "vgroup" => "q23r3"
            },
            %{
              "col" => "c1",
              "colTitle" => "Quantity",
              "label" => "q23r4c1",
              "qlabel" => "q23",
              "qtitle" => "New Shopping Cart Question",
              "row" => "r4",
              "rowTitle" => "[Software ™ Corporate © Edition] Upload Image",
              "title" => "Quantity - [Software ™ Corporate © Edition] Upload Image - New Shopping Cart Question",
              "type" => "text",
              "vgroup" => "q23r4"
            },
            %{
              "col" => "c2",
              "colTitle" => "Click Order",
              "label" => "q23r4c2",
              "qlabel" => "q23",
              "qtitle" => "New Shopping Cart Question",
              "row" => "r4",
              "rowTitle" => "[Software ™ Corporate © Edition] Upload Image",
              "title" => "Click Order - [Software ™ Corporate © Edition] Upload Image - New Shopping Cart Question",
              "type" => "text",
              "vgroup" => "q23r4"
            },
            %{
              "col" => "c3",
              "colTitle" => "Seconds Viewed",
              "label" => "q23r4c3",
              "qlabel" => "q23",
              "qtitle" => "New Shopping Cart Question",
              "row" => "r4",
              "rowTitle" => "[Software ™ Corporate © Edition] Upload Image",
              "title" => "Seconds Viewed - [Software ™ Corporate © Edition] Upload Image - New Shopping Cart Question",
              "type" => "text",
              "vgroup" => "q23r4"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q24",
          "qtitle" => "New Card Sort Single Select Question",
          "type" => "single",
          "values" => [
            %{"title" => "Bucket 1", "value" => 1},
            %{"title" => "Bucket 2", "value" => 2},
            %{"title" => "Bucket 3", "value" => 3}
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q24r1",
              "qlabel" => "q24",
              "qtitle" => "New Card Sort Single Select Question",
              "row" => "r1",
              "rowTitle" => "Card 1",
              "title" => "Card 1 - New Card Sort Single Select Question",
              "type" => "single",
              "values" => [
                %{"title" => "Bucket 1", "value" => 1},
                %{"title" => "Bucket 2", "value" => 2},
                %{"title" => "Bucket 3", "value" => 3}
              ],
              "vgroup" => "q24"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q24r2",
              "qlabel" => "q24",
              "qtitle" => "New Card Sort Single Select Question",
              "row" => "r2",
              "rowTitle" => "Card 2",
              "title" => "Card 2 - New Card Sort Single Select Question",
              "type" => "single",
              "values" => [
                %{"title" => "Bucket 1", "value" => 1},
                %{"title" => "Bucket 2", "value" => 2},
                %{"title" => "Bucket 3", "value" => 3}
              ],
              "vgroup" => "q24"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q24r3",
              "qlabel" => "q24",
              "qtitle" => "New Card Sort Single Select Question",
              "row" => "r3",
              "rowTitle" => "Card 3",
              "title" => "Card 3 - New Card Sort Single Select Question",
              "type" => "single",
              "values" => [
                %{"title" => "Bucket 1", "value" => 1},
                %{"title" => "Bucket 2", "value" => 2},
                %{"title" => "Bucket 3", "value" => 3}
              ],
              "vgroup" => "q24"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q25",
          "qtitle" => "New 'This or That' Question",
          "type" => "single",
          "values" => [
            %{"title" => "Ex 1", "value" => 1},
            %{"title" => "Ex 2", "value" => 2},
            %{"title" => "Ex 3", "value" => 3},
            %{"title" => "Ex 4", "value" => 4},
            %{"title" => "Ex 5", "value" => 5}
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q25r1",
              "qlabel" => "q25",
              "qtitle" => "New 'This or That' Question",
              "row" => "r1",
              "rowTitle" => "Idea A",
              "title" => "Idea A - New 'This or That' Question",
              "type" => "single",
              "values" => [
                %{"title" => "Ex 1", "value" => 1},
                %{"title" => "Ex 2", "value" => 2},
                %{"title" => "Ex 3", "value" => 3},
                %{"title" => "Ex 4", "value" => 4},
                %{"title" => "Ex 5", "value" => 5}
              ],
              "vgroup" => "q25"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q25r2",
              "qlabel" => "q25",
              "qtitle" => "New 'This or That' Question",
              "row" => "r2",
              "rowTitle" => "Idea C",
              "title" => "Idea C - New 'This or That' Question",
              "type" => "single",
              "values" => [
                %{"title" => "Ex 1", "value" => 1},
                %{"title" => "Ex 2", "value" => 2},
                %{"title" => "Ex 3", "value" => 3},
                %{"title" => "Ex 4", "value" => 4},
                %{"title" => "Ex 5", "value" => 5}
              ],
              "vgroup" => "q25"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q25r3",
              "qlabel" => "q25",
              "qtitle" => "New 'This or That' Question",
              "row" => "r3",
              "rowTitle" => "Idea E",
              "title" => "Idea E - New 'This or That' Question",
              "type" => "single",
              "values" => [
                %{"title" => "Ex 1", "value" => 1},
                %{"title" => "Ex 2", "value" => 2},
                %{"title" => "Ex 3", "value" => 3},
                %{"title" => "Ex 4", "value" => 4},
                %{"title" => "Ex 5", "value" => 5}
              ],
              "vgroup" => "q25"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q25r4",
              "qlabel" => "q25",
              "qtitle" => "New 'This or That' Question",
              "row" => "r4",
              "rowTitle" => "Idea G",
              "title" => "Idea G - New 'This or That' Question",
              "type" => "single",
              "values" => [
                %{"title" => "Ex 1", "value" => 1},
                %{"title" => "Ex 2", "value" => 2},
                %{"title" => "Ex 3", "value" => 3},
                %{"title" => "Ex 4", "value" => 4},
                %{"title" => "Ex 5", "value" => 5}
              ],
              "vgroup" => "q25"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q25_norm",
          "qtitle" => "New 'This or That' Question - NORMALIZED",
          "type" => "single",
          "values" => [
            %{"title" => "Ex 1", "value" => 1},
            %{"title" => "Ex 2", "value" => 2},
            %{"title" => "Ex 3", "value" => 3},
            %{"title" => "Ex 4", "value" => 4},
            %{"title" => "Ex 5", "value" => 5}
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q25_normr1_l",
              "qlabel" => "q25_norm",
              "qtitle" => "New 'This or That' Question - NORMALIZED",
              "row" => "r1_l",
              "rowTitle" => "Idea A",
              "title" => "Idea A - New 'This or That' Question - NORMALIZED",
              "type" => "single",
              "values" => [
                %{"title" => "Ex 1", "value" => 1},
                %{"title" => "Ex 2", "value" => 2},
                %{"title" => "Ex 3", "value" => 3},
                %{"title" => "Ex 4", "value" => 4},
                %{"title" => "Ex 5", "value" => 5}
              ],
              "vgroup" => "q25_norm"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q25_normr1_r",
              "qlabel" => "q25_norm",
              "qtitle" => "New 'This or That' Question - NORMALIZED",
              "row" => "r1_r",
              "rowTitle" => "Idea B",
              "title" => "Idea B - New 'This or That' Question - NORMALIZED",
              "type" => "single",
              "values" => [
                %{"title" => "Ex 1", "value" => 1},
                %{"title" => "Ex 2", "value" => 2},
                %{"title" => "Ex 3", "value" => 3},
                %{"title" => "Ex 4", "value" => 4},
                %{"title" => "Ex 5", "value" => 5}
              ],
              "vgroup" => "q25_norm"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q25_normr2_l",
              "qlabel" => "q25_norm",
              "qtitle" => "New 'This or That' Question - NORMALIZED",
              "row" => "r2_l",
              "rowTitle" => "Idea C",
              "title" => "Idea C - New 'This or That' Question - NORMALIZED",
              "type" => "single",
              "values" => [
                %{"title" => "Ex 1", "value" => 1},
                %{"title" => "Ex 2", "value" => 2},
                %{"title" => "Ex 3", "value" => 3},
                %{"title" => "Ex 4", "value" => 4},
                %{"title" => "Ex 5", "value" => 5}
              ],
              "vgroup" => "q25_norm"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q25_normr2_r",
              "qlabel" => "q25_norm",
              "qtitle" => "New 'This or That' Question - NORMALIZED",
              "row" => "r2_r",
              "rowTitle" => "Idea D",
              "title" => "Idea D - New 'This or That' Question - NORMALIZED",
              "type" => "single",
              "values" => [
                %{"title" => "Ex 1", "value" => 1},
                %{"title" => "Ex 2", "value" => 2},
                %{"title" => "Ex 3", "value" => 3},
                %{"title" => "Ex 4", "value" => 4},
                %{"title" => "Ex 5", "value" => 5}
              ],
              "vgroup" => "q25_norm"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q25_normr3_l",
              "qlabel" => "q25_norm",
              "qtitle" => "New 'This or That' Question - NORMALIZED",
              "row" => "r3_l",
              "rowTitle" => "Idea E",
              "title" => "Idea E - New 'This or That' Question - NORMALIZED",
              "type" => "single",
              "values" => [
                %{"title" => "Ex 1", "value" => 1},
                %{"title" => "Ex 2", "value" => 2},
                %{"title" => "Ex 3", "value" => 3},
                %{"title" => "Ex 4", "value" => 4},
                %{"title" => "Ex 5", "value" => 5}
              ],
              "vgroup" => "q25_norm"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q25_normr3_r",
              "qlabel" => "q25_norm",
              "qtitle" => "New 'This or That' Question - NORMALIZED",
              "row" => "r3_r",
              "rowTitle" => "Idea F",
              "title" => "Idea F - New 'This or That' Question - NORMALIZED",
              "type" => "single",
              "values" => [
                %{"title" => "Ex 1", "value" => 1},
                %{"title" => "Ex 2", "value" => 2},
                %{"title" => "Ex 3", "value" => 3},
                %{"title" => "Ex 4", "value" => 4},
                %{"title" => "Ex 5", "value" => 5}
              ],
              "vgroup" => "q25_norm"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q25_normr4_l",
              "qlabel" => "q25_norm",
              "qtitle" => "New 'This or That' Question - NORMALIZED",
              "row" => "r4_l",
              "rowTitle" => "Idea G",
              "title" => "Idea G - New 'This or That' Question - NORMALIZED",
              "type" => "single",
              "values" => [
                %{"title" => "Ex 1", "value" => 1},
                %{"title" => "Ex 2", "value" => 2},
                %{"title" => "Ex 3", "value" => 3},
                %{"title" => "Ex 4", "value" => 4},
                %{"title" => "Ex 5", "value" => 5}
              ],
              "vgroup" => "q25_norm"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q25_normr4_r",
              "qlabel" => "q25_norm",
              "qtitle" => "New 'This or That' Question - NORMALIZED",
              "row" => "r4_r",
              "rowTitle" => "Idea H",
              "title" => "Idea H - New 'This or That' Question - NORMALIZED",
              "type" => "single",
              "values" => [
                %{"title" => "Ex 1", "value" => 1},
                %{"title" => "Ex 2", "value" => 2},
                %{"title" => "Ex 3", "value" => 3},
                %{"title" => "Ex 4", "value" => 4},
                %{"title" => "Ex 5", "value" => 5}
              ],
              "vgroup" => "q25_norm"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q28",
          "qtitle" => "Pick all that apply",
          "type" => "multiple",
          "variables" => [
            %{
              "col" => "c1",
              "colTitle" => "Good",
              "label" => "q28r1c1",
              "qlabel" => "q28",
              "qtitle" => "Pick all that apply",
              "row" => "r1",
              "rowTitle" => "Apple",
              "title" => "Good - Apple - Pick all that apply",
              "type" => "multiple",
              "vgroup" => "q28r1"
            },
            %{
              "col" => "c2",
              "colTitle" => "Bad",
              "label" => "q28r1c2",
              "qlabel" => "q28",
              "qtitle" => "Pick all that apply",
              "row" => "r1",
              "rowTitle" => "Apple",
              "title" => "Bad - Apple - Pick all that apply",
              "type" => "multiple",
              "vgroup" => "q28r1"
            },
            %{
              "col" => "c3",
              "colTitle" => "Ugly",
              "label" => "q28r1c3",
              "qlabel" => "q28",
              "qtitle" => "Pick all that apply",
              "row" => "r1",
              "rowTitle" => "Apple",
              "title" => "Ugly - Apple - Pick all that apply",
              "type" => "multiple",
              "vgroup" => "q28r1"
            },
            %{
              "col" => "c1",
              "colTitle" => "Good",
              "label" => "q28r2c1",
              "qlabel" => "q28",
              "qtitle" => "Pick all that apply",
              "row" => "r2",
              "rowTitle" => "Orange",
              "title" => "Good - Orange - Pick all that apply",
              "type" => "multiple",
              "vgroup" => "q28r2"
            },
            %{
              "col" => "c2",
              "colTitle" => "Bad",
              "label" => "q28r2c2",
              "qlabel" => "q28",
              "qtitle" => "Pick all that apply",
              "row" => "r2",
              "rowTitle" => "Orange",
              "title" => "Bad - Orange - Pick all that apply",
              "type" => "multiple",
              "vgroup" => "q28r2"
            },
            %{
              "col" => "c3",
              "colTitle" => "Ugly",
              "label" => "q28r2c3",
              "qlabel" => "q28",
              "qtitle" => "Pick all that apply",
              "row" => "r2",
              "rowTitle" => "Orange",
              "title" => "Ugly - Orange - Pick all that apply",
              "type" => "multiple",
              "vgroup" => "q28r2"
            },
            %{
              "col" => "c1",
              "colTitle" => "Good",
              "label" => "q28r3c1",
              "qlabel" => "q28",
              "qtitle" => "Pick all that apply",
              "row" => "r3",
              "rowTitle" => "Banana",
              "title" => "Good - Banana - Pick all that apply",
              "type" => "multiple",
              "vgroup" => "q28r3"
            },
            %{
              "col" => "c2",
              "colTitle" => "Bad",
              "label" => "q28r3c2",
              "qlabel" => "q28",
              "qtitle" => "Pick all that apply",
              "row" => "r3",
              "rowTitle" => "Banana",
              "title" => "Bad - Banana - Pick all that apply",
              "type" => "multiple",
              "vgroup" => "q28r3"
            },
            %{
              "col" => "c3",
              "colTitle" => "Ugly",
              "label" => "q28r3c3",
              "qlabel" => "q28",
              "qtitle" => "Pick all that apply",
              "row" => "r3",
              "rowTitle" => "Banana",
              "title" => "Ugly - Banana - Pick all that apply",
              "type" => "multiple",
              "vgroup" => "q28r3"
            }
          ]
        },
        %{
          "grouping" => "cols",
          "qlabel" => "q29",
          "qtitle" => "Rank these OSes",
          "type" => "single",
          "values" => [
            %{"title" => "Best", "value" => 1},
            %{"title" => "Okay", "value" => 2},
            %{"title" => "Worst", "value" => 3},
            %{
              "title" => "Perhaps will bring about the end of life as we know it",
              "value" => 4
            }
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q29r1",
              "qlabel" => "q29",
              "qtitle" => "Rank these OSes",
              "row" => "r1",
              "rowTitle" => "Linux",
              "title" => "Linux - Rank these OSes",
              "type" => "single",
              "values" => [
                %{"title" => "Best", "value" => 1},
                %{"title" => "Okay", "value" => 2},
                %{"title" => "Worst", "value" => 3},
                %{
                  "title" => "Perhaps will bring about the end of life as we know it",
                  "value" => 4
                }
              ],
              "vgroup" => "q29"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q29r2",
              "qlabel" => "q29",
              "qtitle" => "Rank these OSes",
              "row" => "r2",
              "rowTitle" => "Windows",
              "title" => "Windows - Rank these OSes",
              "type" => "single",
              "values" => [
                %{"title" => "Best", "value" => 1},
                %{"title" => "Okay", "value" => 2},
                %{"title" => "Worst", "value" => 3},
                %{
                  "title" => "Perhaps will bring about the end of life as we know it",
                  "value" => 4
                }
              ],
              "vgroup" => "q29"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q29r3",
              "qlabel" => "q29",
              "qtitle" => "Rank these OSes",
              "row" => "r3",
              "rowTitle" => "BSD",
              "title" => "BSD - Rank these OSes",
              "type" => "single",
              "values" => [
                %{"title" => "Best", "value" => 1},
                %{"title" => "Okay", "value" => 2},
                %{"title" => "Worst", "value" => 3},
                %{
                  "title" => "Perhaps will bring about the end of life as we know it",
                  "value" => 4
                }
              ],
              "vgroup" => "q29"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q29r4",
              "qlabel" => "q29",
              "qtitle" => "Rank these OSes",
              "row" => "r4",
              "rowTitle" => "Unix",
              "title" => "Unix - Rank these OSes",
              "type" => "single",
              "values" => [
                %{"title" => "Best", "value" => 1},
                %{"title" => "Okay", "value" => 2},
                %{"title" => "Worst", "value" => 3},
                %{
                  "title" => "Perhaps will bring about the end of life as we know it",
                  "value" => 4
                }
              ],
              "vgroup" => "q29"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q31",
          "qtitle" => "Rate yourself",
          "type" => "number",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q31r1",
              "qlabel" => "q31",
              "qtitle" => "Rate yourself",
              "row" => "r1",
              "rowTitle" => "Points",
              "title" => "Rate yourself",
              "type" => "number",
              "vgroup" => "q31"
            }
          ]
        },
        %{
          "grouping" => "cols",
          "qlabel" => "q30",
          "qtitle" => "Rate different aspects of the TV show Legion",
          "type" => "number",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q30r1",
              "qlabel" => "q30",
              "qtitle" => "Rate different aspects of the TV show Legion",
              "row" => "r1",
              "rowTitle" => "Cinematagraphy",
              "title" => "Cinematagraphy - Rate different aspects of the TV show Legion",
              "type" => "number",
              "vgroup" => "q30"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q30r2",
              "qlabel" => "q30",
              "qtitle" => "Rate different aspects of the TV show Legion",
              "row" => "r2",
              "rowTitle" => "Acting",
              "title" => "Acting - Rate different aspects of the TV show Legion",
              "type" => "number",
              "vgroup" => "q30"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q30r3",
              "qlabel" => "q30",
              "qtitle" => "Rate different aspects of the TV show Legion",
              "row" => "r3",
              "rowTitle" => "Soundtrack",
              "title" => "Soundtrack - Rate different aspects of the TV show Legion",
              "type" => "number",
              "vgroup" => "q30"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q21",
          "qtitle" => "How do you feel about the state of the world",
          "type" => "single",
          "values" => [
            %{"title" => "Horrible", "value" => 1},
            %{"title" => "Slight better than horrible", "value" => 2},
            %{"title" => "Awful", "value" => 3},
            %{"title" => "Numb", "value" => 4},
            %{"title" => "Okay", "value" => 5},
            %{"title" => "Better than okay", "value" => 6},
            %{"title" => "Great", "value" => 7}
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q21",
              "qlabel" => "q21",
              "qtitle" => "How do you feel about the state of the world",
              "row" => nil,
              "rowTitle" => nil,
              "title" => "How do you feel about the state of the world",
              "type" => "single",
              "values" => [
                %{"title" => "Horrible", "value" => 1},
                %{"title" => "Slight better than horrible", "value" => 2},
                %{"title" => "Awful", "value" => 3},
                %{"title" => "Numb", "value" => 4},
                %{"title" => "Okay", "value" => 5},
                %{"title" => "Better than okay", "value" => 6},
                %{"title" => "Great", "value" => 7}
              ],
              "vgroup" => "q21"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q32",
          "qtitle" => "Rate your best friend.",
          "type" => "float",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q32r1",
              "qlabel" => "q32",
              "qtitle" => "Rate your best friend.",
              "row" => "r1",
              "rowTitle" => "Points",
              "title" => "Rate your best friend.",
              "type" => "float",
              "vgroup" => "q32"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q35",
          "qtitle" => "Upload a random image",
          "type" => "text",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q35",
              "qlabel" => "q35",
              "qtitle" => "Upload a random image",
              "row" => nil,
              "rowTitle" => nil,
              "title" => "Upload a random image",
              "type" => "text",
              "vgroup" => "q35"
            }
          ]
        },
        %{
          "grouping" => "cols",
          "qlabel" => "q36",
          "qtitle" => "Highlight&nbsp;parts you like, don't like, and don't care about",
          "type" => "single",
          "values" => [
            %{"title" => "Like", "value" => 1},
            %{"title" => "Don't Like", "value" => 2},
            %{"title" => "Don't Care", "value" => 3}
          ],
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q36r1",
              "qlabel" => "q36",
              "qtitle" => "Highlight&nbsp;parts you like, don't like, and don't care about",
              "row" => "r1",
              "rowTitle" => "Ponds are frequently human-constructed. In the countryside farmers and villagers dig a pond in their backyard or increase the depth of an existing pond by removing layers of mud during summer season. A wide variety of artificial bodies of water are classified as ponds. Some ponds are created specifically for habitat restoration, including water treatment. Others, likewater gardens, water features and koi ponds are designed for aesthetic ornamentation as landscape or architectural features.Fish pondsare designed for commercial fish breeding, andsolar pondsdesigned to store thermal energy.Treatment pondsare used to treatwastewater.",
              "title" => "Ponds are frequently human-constructed. In the countryside farmers and villagers dig a pond in their backyard or increase the depth of an existing pond by removing layers of mud during summer season. A wide variety of artificial bodies of water are classified as ponds. Some ponds are created specifically for habitat restoration, including water treatment. Others, likewater gardens, water features and koi ponds are designed for aesthetic ornamentation as landscape or architectural features.Fish pondsare designed for commercial fish breeding, andsolar pondsdesigned to store thermal energy.Treatment pondsare used to treatwastewater. - Highlight&nbsp;parts you like, don't like, and don't care about",
              "type" => "single",
              "values" => [
                %{"title" => "Like", "value" => 1},
                %{"title" => "Don't Like", "value" => 2},
                %{"title" => "Don't Care", "value" => 3}
              ],
              "vgroup" => "q36"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q36r2",
              "qlabel" => "q36",
              "qtitle" => "Highlight&nbsp;parts you like, don't like, and don't care about",
              "row" => "r2",
              "rowTitle" => "Standing bodies of water such aspuddles, ponds, and lakes are often categorized separately from flowing water courses, such as brooks, creeks, streams or rivers. Nutrient levels and water quality in ponds can be controlled through natural process such as algal growth, or through artificial filtration, such as analgae scrubber.",
              "title" => "Standing bodies of water such aspuddles, ponds, and lakes are often categorized separately from flowing water courses, such as brooks, creeks, streams or rivers. Nutrient levels and water quality in ponds can be controlled through natural process such as algal growth, or through artificial filtration, such as analgae scrubber. - Highlight&nbsp;parts you like, don't like, and don't care about",
              "type" => "single",
              "values" => [
                %{"title" => "Like", "value" => 1},
                %{"title" => "Don't Like", "value" => 2},
                %{"title" => "Don't Care", "value" => 3}
              ],
              "vgroup" => "q36"
            }
          ]
        },
        %{
          "grouping" => "rows",
          "qlabel" => "q37",
          "qtitle" => "Record a video testimonial",
          "type" => "text",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q37",
              "qlabel" => "q37",
              "qtitle" => "Record a video testimonial",
              "row" => nil,
              "rowTitle" => nil,
              "title" => "Record a video testimonial",
              "type" => "text",
              "vgroup" => "q37"
            }
          ]
        },
        %{
          "grouping" => "cols",
          "qlabel" => "q39",
          "qtitle" => "How do you feel about this theft?",
          "type" => "text",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q39play_count",
              "qlabel" => "q39",
              "qtitle" => "How do you feel about this theft?",
              "row" => "play_count",
              "rowTitle" => "Play Count",
              "title" => "Play Count - How do you feel about this theft?",
              "type" => "text",
              "vgroup" => "q39"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "q39time_elapsed",
              "qlabel" => "q39",
              "qtitle" => "How do you feel about this theft?",
              "row" => "time_elapsed",
              "rowTitle" => "Elapsed Time",
              "title" => "Elapsed Time - How do you feel about this theft?",
              "type" => "text",
              "vgroup" => "q39"
            }
          ]
        },
        %{
          "grouping" => "cols",
          "qlabel" => "noanswer",
          "qtitle" => "No Answer",
          "type" => "multiple",
          "variables" => [
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "noanswerq35_na_q35",
              "noanswerParent" => "q35",
              "qlabel" => "noanswer",
              "qtitle" => "No Answer",
              "row" => "q35_na_q35",
              "rowTitle" => "Upload a random image: NA",
              "title" => "Upload a random image: NA - No Answer",
              "type" => "multiple",
              "vgroup" => "noanswer"
            },
            %{
              "col" => nil,
              "colTitle" => nil,
              "label" => "noanswerq37_na_q37",
              "noanswerParent" => "q37",
              "qlabel" => "noanswer",
              "qtitle" => "No Answer",
              "row" => "q37_na_q37",
              "rowTitle" => "Record a video testimonial: NA",
              "title" => "Record a video testimonial: NA - No Answer",
              "type" => "multiple",
              "vgroup" => "noanswer"
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
      survey_id: "selfserve/540/all_questions",
      variables: [
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
          "qtitle" => "Do you care about the sky?",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Do you care about the sky?",
          "type" => "single",
          "values" => [
            %{"title" => "Yes", "value" => 1},
            %{"title" => "No", "value" => 2},
            %{"title" => "Maybe", "value" => 3},
            %{"title" => "No really", "value" => 4}
          ],
          "vgroup" => "q1"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q2r1",
          "qlabel" => "q2",
          "qtitle" => "How do you feel about each snack?",
          "row" => "r1",
          "rowTitle" => "Snickers",
          "title" => "Snickers - How do you feel about each snack?",
          "type" => "single",
          "values" => [
            %{"title" => "Dissatisfied&nbsp;", "value" => 1},
            %{"title" => "Meh", "value" => 2},
            %{"title" => "Very Happy", "value" => 3}
          ],
          "vgroup" => "q2"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q2r2",
          "qlabel" => "q2",
          "qtitle" => "How do you feel about each snack?",
          "row" => "r2",
          "rowTitle" => "Fruit",
          "title" => "Fruit - How do you feel about each snack?",
          "type" => "single",
          "values" => [
            %{"title" => "Dissatisfied&nbsp;", "value" => 1},
            %{"title" => "Meh", "value" => 2},
            %{"title" => "Very Happy", "value" => 3}
          ],
          "vgroup" => "q2"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q2r3",
          "qlabel" => "q2",
          "qtitle" => "How do you feel about each snack?",
          "row" => "r3",
          "rowTitle" => "Scooby Snacks",
          "title" => "Scooby Snacks - How do you feel about each snack?",
          "type" => "single",
          "values" => [
            %{"title" => "Dissatisfied&nbsp;", "value" => 1},
            %{"title" => "Meh", "value" => 2},
            %{"title" => "Very Happy", "value" => 3}
          ],
          "vgroup" => "q2"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q3r1",
          "qlabel" => "q3",
          "qtitle" => "Which do you prefer?&nbsp;",
          "row" => "r1",
          "rowTitle" => "Food",
          "title" => "Food - Which do you prefer?&nbsp;",
          "type" => "multiple",
          "vgroup" => "q3"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q3r2",
          "qlabel" => "q3",
          "qtitle" => "Which do you prefer?&nbsp;",
          "row" => "r2",
          "rowTitle" => "Water",
          "title" => "Water - Which do you prefer?&nbsp;",
          "type" => "multiple",
          "vgroup" => "q3"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q3r3",
          "qlabel" => "q3",
          "qtitle" => "Which do you prefer?&nbsp;",
          "row" => "r3",
          "rowTitle" => "Snacks",
          "title" => "Snacks - Which do you prefer?&nbsp;",
          "type" => "multiple",
          "vgroup" => "q3"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q3r4",
          "qlabel" => "q3",
          "qtitle" => "Which do you prefer?&nbsp;",
          "row" => "r4",
          "rowTitle" => "Air",
          "title" => "Air - Which do you prefer?&nbsp;",
          "type" => "multiple",
          "vgroup" => "q3"
        },
        %{
          "col" => "c1",
          "colTitle" => "Hate it",
          "label" => "q4r1c1",
          "qlabel" => "q4",
          "qtitle" => "How do you feel about the following?",
          "row" => "r1",
          "rowTitle" => "Wood",
          "title" => "Hate it - Wood - How do you feel about the following?",
          "type" => "multiple",
          "vgroup" => "q4r1"
        },
        %{
          "col" => "c2",
          "colTitle" => "Don't care one way or the other",
          "label" => "q4r1c2",
          "qlabel" => "q4",
          "qtitle" => "How do you feel about the following?",
          "row" => "r1",
          "rowTitle" => "Wood",
          "title" => "Don't care one way or the other - Wood - How do you feel about the following?",
          "type" => "multiple",
          "vgroup" => "q4r1"
        },
        %{
          "col" => "c3",
          "colTitle" => "Love it",
          "label" => "q4r1c3",
          "qlabel" => "q4",
          "qtitle" => "How do you feel about the following?",
          "row" => "r1",
          "rowTitle" => "Wood",
          "title" => "Love it - Wood - How do you feel about the following?",
          "type" => "multiple",
          "vgroup" => "q4r1"
        },
        %{
          "col" => "c1",
          "colTitle" => "Hate it",
          "label" => "q4r2c1",
          "qlabel" => "q4",
          "qtitle" => "How do you feel about the following?",
          "row" => "r2",
          "rowTitle" => "Water",
          "title" => "Hate it - Water - How do you feel about the following?",
          "type" => "multiple",
          "vgroup" => "q4r2"
        },
        %{
          "col" => "c2",
          "colTitle" => "Don't care one way or the other",
          "label" => "q4r2c2",
          "qlabel" => "q4",
          "qtitle" => "How do you feel about the following?",
          "row" => "r2",
          "rowTitle" => "Water",
          "title" => "Don't care one way or the other - Water - How do you feel about the following?",
          "type" => "multiple",
          "vgroup" => "q4r2"
        },
        %{
          "col" => "c3",
          "colTitle" => "Love it",
          "label" => "q4r2c3",
          "qlabel" => "q4",
          "qtitle" => "How do you feel about the following?",
          "row" => "r2",
          "rowTitle" => "Water",
          "title" => "Love it - Water - How do you feel about the following?",
          "type" => "multiple",
          "vgroup" => "q4r2"
        },
        %{
          "col" => "c1",
          "colTitle" => "Hate it",
          "label" => "q4r3c1",
          "qlabel" => "q4",
          "qtitle" => "How do you feel about the following?",
          "row" => "r3",
          "rowTitle" => "Dirt",
          "title" => "Hate it - Dirt - How do you feel about the following?",
          "type" => "multiple",
          "vgroup" => "q4r3"
        },
        %{
          "col" => "c2",
          "colTitle" => "Don't care one way or the other",
          "label" => "q4r3c2",
          "qlabel" => "q4",
          "qtitle" => "How do you feel about the following?",
          "row" => "r3",
          "rowTitle" => "Dirt",
          "title" => "Don't care one way or the other - Dirt - How do you feel about the following?",
          "type" => "multiple",
          "vgroup" => "q4r3"
        },
        %{
          "col" => "c3",
          "colTitle" => "Love it",
          "label" => "q4r3c3",
          "qlabel" => "q4",
          "qtitle" => "How do you feel about the following?",
          "row" => "r3",
          "rowTitle" => "Dirt",
          "title" => "Love it - Dirt - How do you feel about the following?",
          "type" => "multiple",
          "vgroup" => "q4r3"
        },
        %{
          "col" => "c1",
          "colTitle" => "Hate it",
          "label" => "q4r4c1",
          "qlabel" => "q4",
          "qtitle" => "How do you feel about the following?",
          "row" => "r4",
          "rowTitle" => "Earth",
          "title" => "Hate it - Earth - How do you feel about the following?",
          "type" => "multiple",
          "vgroup" => "q4r4"
        },
        %{
          "col" => "c2",
          "colTitle" => "Don't care one way or the other",
          "label" => "q4r4c2",
          "qlabel" => "q4",
          "qtitle" => "How do you feel about the following?",
          "row" => "r4",
          "rowTitle" => "Earth",
          "title" => "Don't care one way or the other - Earth - How do you feel about the following?",
          "type" => "multiple",
          "vgroup" => "q4r4"
        },
        %{
          "col" => "c3",
          "colTitle" => "Love it",
          "label" => "q4r4c3",
          "qlabel" => "q4",
          "qtitle" => "How do you feel about the following?",
          "row" => "r4",
          "rowTitle" => "Earth",
          "title" => "Love it - Earth - How do you feel about the following?",
          "type" => "multiple",
          "vgroup" => "q4r4"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q5",
          "qlabel" => "q5",
          "qtitle" => "What's your fav brand?",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "What's your fav brand?",
          "type" => "single",
          "values" => [
            %{"title" => "Ford", "value" => 1},
            %{"title" => "Apple", "value" => 2},
            %{"title" => "Chevy", "value" => 3}
          ],
          "vgroup" => "q5"
        },
        %{
          "col" => "c1",
          "colTitle" => "Vans",
          "label" => "q6r1c1",
          "qlabel" => "q6",
          "qtitle" => "Rate each category in each brand",
          "row" => "r1",
          "rowTitle" => "Ford",
          "title" => "Vans - Ford - Rate each category in each brand",
          "type" => "single",
          "values" => [
            %{"title" => "Don't Like", "value" => 1},
            %{"title" => "Eh", "value" => 2},
            %{"title" => "Much Yes", "value" => 3}
          ],
          "vgroup" => "q6r1"
        },
        %{
          "col" => "c2",
          "colTitle" => "SUVs",
          "label" => "q6r1c2",
          "qlabel" => "q6",
          "qtitle" => "Rate each category in each brand",
          "row" => "r1",
          "rowTitle" => "Ford",
          "title" => "SUVs - Ford - Rate each category in each brand",
          "type" => "single",
          "values" => [
            %{"title" => "Don't Like", "value" => 1},
            %{"title" => "Eh", "value" => 2},
            %{"title" => "Much Yes", "value" => 3}
          ],
          "vgroup" => "q6r1"
        },
        %{
          "col" => "c3",
          "colTitle" => "Cars",
          "label" => "q6r1c3",
          "qlabel" => "q6",
          "qtitle" => "Rate each category in each brand",
          "row" => "r1",
          "rowTitle" => "Ford",
          "title" => "Cars - Ford - Rate each category in each brand",
          "type" => "single",
          "values" => [
            %{"title" => "Don't Like", "value" => 1},
            %{"title" => "Eh", "value" => 2},
            %{"title" => "Much Yes", "value" => 3}
          ],
          "vgroup" => "q6r1"
        },
        %{
          "col" => "c1",
          "colTitle" => "Vans",
          "label" => "q6r2c1",
          "qlabel" => "q6",
          "qtitle" => "Rate each category in each brand",
          "row" => "r2",
          "rowTitle" => "Chevy",
          "title" => "Vans - Chevy - Rate each category in each brand",
          "type" => "single",
          "values" => [
            %{"title" => "Don't Like", "value" => 1},
            %{"title" => "Eh", "value" => 2},
            %{"title" => "Much Yes", "value" => 3}
          ],
          "vgroup" => "q6r2"
        },
        %{
          "col" => "c2",
          "colTitle" => "SUVs",
          "label" => "q6r2c2",
          "qlabel" => "q6",
          "qtitle" => "Rate each category in each brand",
          "row" => "r2",
          "rowTitle" => "Chevy",
          "title" => "SUVs - Chevy - Rate each category in each brand",
          "type" => "single",
          "values" => [
            %{"title" => "Don't Like", "value" => 1},
            %{"title" => "Eh", "value" => 2},
            %{"title" => "Much Yes", "value" => 3}
          ],
          "vgroup" => "q6r2"
        },
        %{
          "col" => "c3",
          "colTitle" => "Cars",
          "label" => "q6r2c3",
          "qlabel" => "q6",
          "qtitle" => "Rate each category in each brand",
          "row" => "r2",
          "rowTitle" => "Chevy",
          "title" => "Cars - Chevy - Rate each category in each brand",
          "type" => "single",
          "values" => [
            %{"title" => "Don't Like", "value" => 1},
            %{"title" => "Eh", "value" => 2},
            %{"title" => "Much Yes", "value" => 3}
          ],
          "vgroup" => "q6r2"
        },
        %{
          "col" => "c1",
          "colTitle" => "Vans",
          "label" => "q6r3c1",
          "qlabel" => "q6",
          "qtitle" => "Rate each category in each brand",
          "row" => "r3",
          "rowTitle" => "Porche",
          "title" => "Vans - Porche - Rate each category in each brand",
          "type" => "single",
          "values" => [
            %{"title" => "Don't Like", "value" => 1},
            %{"title" => "Eh", "value" => 2},
            %{"title" => "Much Yes", "value" => 3}
          ],
          "vgroup" => "q6r3"
        },
        %{
          "col" => "c2",
          "colTitle" => "SUVs",
          "label" => "q6r3c2",
          "qlabel" => "q6",
          "qtitle" => "Rate each category in each brand",
          "row" => "r3",
          "rowTitle" => "Porche",
          "title" => "SUVs - Porche - Rate each category in each brand",
          "type" => "single",
          "values" => [
            %{"title" => "Don't Like", "value" => 1},
            %{"title" => "Eh", "value" => 2},
            %{"title" => "Much Yes", "value" => 3}
          ],
          "vgroup" => "q6r3"
        },
        %{
          "col" => "c3",
          "colTitle" => "Cars",
          "label" => "q6r3c3",
          "qlabel" => "q6",
          "qtitle" => "Rate each category in each brand",
          "row" => "r3",
          "rowTitle" => "Porche",
          "title" => "Cars - Porche - Rate each category in each brand",
          "type" => "single",
          "values" => [
            %{"title" => "Don't Like", "value" => 1},
            %{"title" => "Eh", "value" => 2},
            %{"title" => "Much Yes", "value" => 3}
          ],
          "vgroup" => "q6r3"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q7",
          "qlabel" => "q7",
          "qtitle" => "What's your phone number?",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "What's your phone number?",
          "type" => "number",
          "vgroup" => "q7"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q8",
          "qlabel" => "q8",
          "qtitle" => "What's your email?",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "What's your email?",
          "type" => "text",
          "vgroup" => "q8"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q9",
          "qlabel" => "q9",
          "qtitle" => "What does life mean to you?",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "What does life mean to you?",
          "type" => "text",
          "vgroup" => "q9"
        },
        %{
          "col" => "c1",
          "colTitle" => "Cheese",
          "label" => "q10r1c1",
          "qlabel" => "q10",
          "qtitle" => "Monthly spending of cheese and wine",
          "row" => "r1",
          "rowTitle" => "May",
          "title" => "May - Cheese - Monthly spending of cheese and wine",
          "type" => "number",
          "vgroup" => "q10c1"
        },
        %{
          "col" => "c1",
          "colTitle" => "Cheese",
          "label" => "q10r2c1",
          "qlabel" => "q10",
          "qtitle" => "Monthly spending of cheese and wine",
          "row" => "r2",
          "rowTitle" => "June",
          "title" => "June - Cheese - Monthly spending of cheese and wine",
          "type" => "number",
          "vgroup" => "q10c1"
        },
        %{
          "col" => "c1",
          "colTitle" => "Cheese",
          "label" => "q10r3c1",
          "qlabel" => "q10",
          "qtitle" => "Monthly spending of cheese and wine",
          "row" => "r3",
          "rowTitle" => "July",
          "title" => "July - Cheese - Monthly spending of cheese and wine",
          "type" => "number",
          "vgroup" => "q10c1"
        },
        %{
          "col" => "c2",
          "colTitle" => "Wine",
          "label" => "q10r1c2",
          "qlabel" => "q10",
          "qtitle" => "Monthly spending of cheese and wine",
          "row" => "r1",
          "rowTitle" => "May",
          "title" => "May - Wine - Monthly spending of cheese and wine",
          "type" => "number",
          "vgroup" => "q10c2"
        },
        %{
          "col" => "c2",
          "colTitle" => "Wine",
          "label" => "q10r2c2",
          "qlabel" => "q10",
          "qtitle" => "Monthly spending of cheese and wine",
          "row" => "r2",
          "rowTitle" => "June",
          "title" => "June - Wine - Monthly spending of cheese and wine",
          "type" => "number",
          "vgroup" => "q10c2"
        },
        %{
          "col" => "c2",
          "colTitle" => "Wine",
          "label" => "q10r3c2",
          "qlabel" => "q10",
          "qtitle" => "Monthly spending of cheese and wine",
          "row" => "r3",
          "rowTitle" => "July",
          "title" => "July - Wine - Monthly spending of cheese and wine",
          "type" => "number",
          "vgroup" => "q10c2"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q13r1",
          "qlabel" => "q13",
          "qtitle" => "Rate your stay at diff hotels.",
          "row" => "r1",
          "rowTitle" => "Hilton",
          "title" => "Hilton - Rate your stay at diff hotels.",
          "type" => "number",
          "vgroup" => "q13"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q13r2",
          "qlabel" => "q13",
          "qtitle" => "Rate your stay at diff hotels.",
          "row" => "r2",
          "rowTitle" => "Mariot",
          "title" => "Mariot - Rate your stay at diff hotels.",
          "type" => "number",
          "vgroup" => "q13"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q14",
          "qlabel" => "q14",
          "qtitle" => "New Button Single Select Question",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "New Button Single Select Question",
          "type" => "single",
          "values" => [
            %{"title" => "Example r1", "value" => 1},
            %{"title" => "Example r2", "value" => 2},
            %{"title" => "Example r3", "value" => 3}
          ],
          "vgroup" => "q14"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q15r1",
          "qlabel" => "q15",
          "qtitle" => "Do you like or hate the following?",
          "row" => "r1",
          "rowTitle" => "Air",
          "title" => "Air - Do you like or hate the following?",
          "type" => "single",
          "values" => [
            %{"title" => "Hate", "value" => 1},
            %{"title" => "Like", "value" => 2}
          ],
          "vgroup" => "q15"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q15r2",
          "qlabel" => "q15",
          "qtitle" => "Do you like or hate the following?",
          "row" => "r2",
          "rowTitle" => "Water",
          "title" => "Water - Do you like or hate the following?",
          "type" => "single",
          "values" => [
            %{"title" => "Hate", "value" => 1},
            %{"title" => "Like", "value" => 2}
          ],
          "vgroup" => "q15"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q15r3",
          "qlabel" => "q15",
          "qtitle" => "Do you like or hate the following?",
          "row" => "r3",
          "rowTitle" => "Fire",
          "title" => "Fire - Do you like or hate the following?",
          "type" => "single",
          "values" => [
            %{"title" => "Hate", "value" => 1},
            %{"title" => "Like", "value" => 2}
          ],
          "vgroup" => "q15"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q33r1",
          "qlabel" => "q33",
          "qtitle" => "Choose your preferred living space.",
          "row" => "r1",
          "rowTitle" => "Apt",
          "title" => "Apt - Choose your preferred living space.",
          "type" => "multiple",
          "vgroup" => "q33"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q33r2",
          "qlabel" => "q33",
          "qtitle" => "Choose your preferred living space.",
          "row" => "r2",
          "rowTitle" => "House",
          "title" => "House - Choose your preferred living space.",
          "type" => "multiple",
          "vgroup" => "q33"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q33r3",
          "qlabel" => "q33",
          "qtitle" => "Choose your preferred living space.",
          "row" => "r3",
          "rowTitle" => "Box",
          "title" => "Box - Choose your preferred living space.",
          "type" => "multiple",
          "vgroup" => "q33"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q33r4",
          "qlabel" => "q33",
          "qtitle" => "Choose your preferred living space.",
          "row" => "r4",
          "rowTitle" => "Car",
          "title" => "Car - Choose your preferred living space.",
          "type" => "multiple",
          "vgroup" => "q33"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q33r5",
          "qlabel" => "q33",
          "qtitle" => "Choose your preferred living space.",
          "row" => "r5",
          "rowTitle" => "RV",
          "title" => "RV - Choose your preferred living space.",
          "type" => "multiple",
          "vgroup" => "q33"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q33r6",
          "qlabel" => "q33",
          "qtitle" => "Choose your preferred living space.",
          "row" => "r6",
          "rowTitle" => "Tent",
          "title" => "Tent - Choose your preferred living space.",
          "type" => "multiple",
          "vgroup" => "q33"
        },
        %{
          "col" => "c1",
          "colTitle" => "vans",
          "label" => "q34r1c1",
          "qlabel" => "q34",
          "qtitle" => "Choose the places you'd like to live.",
          "row" => "r1",
          "rowTitle" => "Ford",
          "title" => "vans - Ford - Choose the places you'd like to live.",
          "type" => "multiple",
          "vgroup" => "q34r1"
        },
        %{
          "col" => "c2",
          "colTitle" => "cars",
          "label" => "q34r1c2",
          "qlabel" => "q34",
          "qtitle" => "Choose the places you'd like to live.",
          "row" => "r1",
          "rowTitle" => "Ford",
          "title" => "cars - Ford - Choose the places you'd like to live.",
          "type" => "multiple",
          "vgroup" => "q34r1"
        },
        %{
          "col" => "c3",
          "colTitle" => "suvs",
          "label" => "q34r1c3",
          "qlabel" => "q34",
          "qtitle" => "Choose the places you'd like to live.",
          "row" => "r1",
          "rowTitle" => "Ford",
          "title" => "suvs - Ford - Choose the places you'd like to live.",
          "type" => "multiple",
          "vgroup" => "q34r1"
        },
        %{
          "col" => "c1",
          "colTitle" => "vans",
          "label" => "q34r2c1",
          "qlabel" => "q34",
          "qtitle" => "Choose the places you'd like to live.",
          "row" => "r2",
          "rowTitle" => "Chevy",
          "title" => "vans - Chevy - Choose the places you'd like to live.",
          "type" => "multiple",
          "vgroup" => "q34r2"
        },
        %{
          "col" => "c2",
          "colTitle" => "cars",
          "label" => "q34r2c2",
          "qlabel" => "q34",
          "qtitle" => "Choose the places you'd like to live.",
          "row" => "r2",
          "rowTitle" => "Chevy",
          "title" => "cars - Chevy - Choose the places you'd like to live.",
          "type" => "multiple",
          "vgroup" => "q34r2"
        },
        %{
          "col" => "c3",
          "colTitle" => "suvs",
          "label" => "q34r2c3",
          "qlabel" => "q34",
          "qtitle" => "Choose the places you'd like to live.",
          "row" => "r2",
          "rowTitle" => "Chevy",
          "title" => "suvs - Chevy - Choose the places you'd like to live.",
          "type" => "multiple",
          "vgroup" => "q34r2"
        },
        %{
          "col" => "c1",
          "colTitle" => "vans",
          "label" => "q34r3c1",
          "qlabel" => "q34",
          "qtitle" => "Choose the places you'd like to live.",
          "row" => "r3",
          "rowTitle" => "Lotus",
          "title" => "vans - Lotus - Choose the places you'd like to live.",
          "type" => "multiple",
          "vgroup" => "q34r3"
        },
        %{
          "col" => "c2",
          "colTitle" => "cars",
          "label" => "q34r3c2",
          "qlabel" => "q34",
          "qtitle" => "Choose the places you'd like to live.",
          "row" => "r3",
          "rowTitle" => "Lotus",
          "title" => "cars - Lotus - Choose the places you'd like to live.",
          "type" => "multiple",
          "vgroup" => "q34r3"
        },
        %{
          "col" => "c3",
          "colTitle" => "suvs",
          "label" => "q34r3c3",
          "qlabel" => "q34",
          "qtitle" => "Choose the places you'd like to live.",
          "row" => "r3",
          "rowTitle" => "Lotus",
          "title" => "suvs - Lotus - Choose the places you'd like to live.",
          "type" => "multiple",
          "vgroup" => "q34r3"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q16r1",
          "qlabel" => "q16",
          "qtitle" => "Rate these things",
          "row" => "r1",
          "rowTitle" => "Chevy",
          "title" => "Chevy - Rate these things",
          "type" => "single",
          "values" => [
            %{"title" => "Hate&nbsp;❌", "value" => 1},
            %{"title" => "Meh&nbsp;🤷🏻‍♂️", "value" => 2},
            %{"title" => "Love&nbsp;❤️", "value" => 3}
          ],
          "vgroup" => "q16"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q16r2",
          "qlabel" => "q16",
          "qtitle" => "Rate these things",
          "row" => "r2",
          "rowTitle" => "Ford",
          "title" => "Ford - Rate these things",
          "type" => "single",
          "values" => [
            %{"title" => "Hate&nbsp;❌", "value" => 1},
            %{"title" => "Meh&nbsp;🤷🏻‍♂️", "value" => 2},
            %{"title" => "Love&nbsp;❤️", "value" => 3}
          ],
          "vgroup" => "q16"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q16r3",
          "qlabel" => "q16",
          "qtitle" => "Rate these things",
          "row" => "r3",
          "rowTitle" => "Porche",
          "title" => "Porche - Rate these things",
          "type" => "single",
          "values" => [
            %{"title" => "Hate&nbsp;❌", "value" => 1},
            %{"title" => "Meh&nbsp;🤷🏻‍♂️", "value" => 2},
            %{"title" => "Love&nbsp;❤️", "value" => 3}
          ],
          "vgroup" => "q16"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q16r4",
          "qlabel" => "q16",
          "qtitle" => "Rate these things",
          "row" => "r4",
          "rowTitle" => "Lotus",
          "title" => "Lotus - Rate these things",
          "type" => "single",
          "values" => [
            %{"title" => "Hate&nbsp;❌", "value" => 1},
            %{"title" => "Meh&nbsp;🤷🏻‍♂️", "value" => 2},
            %{"title" => "Love&nbsp;❤️", "value" => 3}
          ],
          "vgroup" => "q16"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q16r5",
          "qlabel" => "q16",
          "qtitle" => "Rate these things",
          "row" => "r5",
          "rowTitle" => "Packer",
          "title" => "Packer - Rate these things",
          "type" => "single",
          "values" => [
            %{"title" => "Hate&nbsp;❌", "value" => 1},
            %{"title" => "Meh&nbsp;🤷🏻‍♂️", "value" => 2},
            %{"title" => "Love&nbsp;❤️", "value" => 3}
          ],
          "vgroup" => "q16"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q20r1",
          "qlabel" => "q20",
          "qtitle" => "Rate these, okay?",
          "row" => "r1",
          "rowTitle" => "Cars",
          "title" => "Cars - Rate these, okay?",
          "type" => "single",
          "values" => [
            %{"title" => "death&nbsp;☠️", "value" => 1},
            %{"title" => "vomit 🤮", "value" => 2},
            %{"title" => "heart&nbsp;❤️", "value" => 3}
          ],
          "vgroup" => "q20"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q20r2",
          "qlabel" => "q20",
          "qtitle" => "Rate these, okay?",
          "row" => "r2",
          "rowTitle" => "Bikes",
          "title" => "Bikes - Rate these, okay?",
          "type" => "single",
          "values" => [
            %{"title" => "death&nbsp;☠️", "value" => 1},
            %{"title" => "vomit 🤮", "value" => 2},
            %{"title" => "heart&nbsp;❤️", "value" => 3}
          ],
          "vgroup" => "q20"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q20r3",
          "qlabel" => "q20",
          "qtitle" => "Rate these, okay?",
          "row" => "r3",
          "rowTitle" => "Trucks",
          "title" => "Trucks - Rate these, okay?",
          "type" => "single",
          "values" => [
            %{"title" => "death&nbsp;☠️", "value" => 1},
            %{"title" => "vomit 🤮", "value" => 2},
            %{"title" => "heart&nbsp;❤️", "value" => 3}
          ],
          "vgroup" => "q20"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q22r1",
          "qlabel" => "q22",
          "qtitle" => "What would you rate these movies?",
          "row" => "r1",
          "rowTitle" => "Back to the Future 2",
          "title" => "Back to the Future 2 - What would you rate these movies?",
          "type" => "single",
          "values" => [
            %{"title" => "Star 1", "value" => 1},
            %{"title" => "Star 2", "value" => 2},
            %{"title" => "Star 3", "value" => 3},
            %{"title" => "Star 4", "value" => 4},
            %{"title" => "Star 5", "value" => 5}
          ],
          "vgroup" => "q22"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q22r2",
          "qlabel" => "q22",
          "qtitle" => "What would you rate these movies?",
          "row" => "r2",
          "rowTitle" => "Back to the Future 3",
          "title" => "Back to the Future 3 - What would you rate these movies?",
          "type" => "single",
          "values" => [
            %{"title" => "Star 1", "value" => 1},
            %{"title" => "Star 2", "value" => 2},
            %{"title" => "Star 3", "value" => 3},
            %{"title" => "Star 4", "value" => 4},
            %{"title" => "Star 5", "value" => 5}
          ],
          "vgroup" => "q22"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q22r3",
          "qlabel" => "q22",
          "qtitle" => "What would you rate these movies?",
          "row" => "r3",
          "rowTitle" => "Jurassic Park",
          "title" => "Jurassic Park - What would you rate these movies?",
          "type" => "single",
          "values" => [
            %{"title" => "Star 1", "value" => 1},
            %{"title" => "Star 2", "value" => 2},
            %{"title" => "Star 3", "value" => 3},
            %{"title" => "Star 4", "value" => 4},
            %{"title" => "Star 5", "value" => 5}
          ],
          "vgroup" => "q22"
        },
        %{
          "col" => "c1",
          "colTitle" => "Quantity",
          "label" => "q23r1c1",
          "qlabel" => "q23",
          "qtitle" => "New Shopping Cart Question",
          "row" => "r1",
          "rowTitle" => "[Software ™ Standard © Edition] Upload Image",
          "title" => "Quantity - [Software ™ Standard © Edition] Upload Image - New Shopping Cart Question",
          "type" => "text",
          "vgroup" => "q23r1"
        },
        %{
          "col" => "c2",
          "colTitle" => "Click Order",
          "label" => "q23r1c2",
          "qlabel" => "q23",
          "qtitle" => "New Shopping Cart Question",
          "row" => "r1",
          "rowTitle" => "[Software ™ Standard © Edition] Upload Image",
          "title" => "Click Order - [Software ™ Standard © Edition] Upload Image - New Shopping Cart Question",
          "type" => "text",
          "vgroup" => "q23r1"
        },
        %{
          "col" => "c3",
          "colTitle" => "Seconds Viewed",
          "label" => "q23r1c3",
          "qlabel" => "q23",
          "qtitle" => "New Shopping Cart Question",
          "row" => "r1",
          "rowTitle" => "[Software ™ Standard © Edition] Upload Image",
          "title" => "Seconds Viewed - [Software ™ Standard © Edition] Upload Image - New Shopping Cart Question",
          "type" => "text",
          "vgroup" => "q23r1"
        },
        %{
          "col" => "c1",
          "colTitle" => "Quantity",
          "label" => "q23r2c1",
          "qlabel" => "q23",
          "qtitle" => "New Shopping Cart Question",
          "row" => "r2",
          "rowTitle" => "[Software ™ Enhanced © Edition] Upload Image",
          "title" => "Quantity - [Software ™ Enhanced © Edition] Upload Image - New Shopping Cart Question",
          "type" => "text",
          "vgroup" => "q23r2"
        },
        %{
          "col" => "c2",
          "colTitle" => "Click Order",
          "label" => "q23r2c2",
          "qlabel" => "q23",
          "qtitle" => "New Shopping Cart Question",
          "row" => "r2",
          "rowTitle" => "[Software ™ Enhanced © Edition] Upload Image",
          "title" => "Click Order - [Software ™ Enhanced © Edition] Upload Image - New Shopping Cart Question",
          "type" => "text",
          "vgroup" => "q23r2"
        },
        %{
          "col" => "c3",
          "colTitle" => "Seconds Viewed",
          "label" => "q23r2c3",
          "qlabel" => "q23",
          "qtitle" => "New Shopping Cart Question",
          "row" => "r2",
          "rowTitle" => "[Software ™ Enhanced © Edition] Upload Image",
          "title" => "Seconds Viewed - [Software ™ Enhanced © Edition] Upload Image - New Shopping Cart Question",
          "type" => "text",
          "vgroup" => "q23r2"
        },
        %{
          "col" => "c1",
          "colTitle" => "Quantity",
          "label" => "q23r3c1",
          "qlabel" => "q23",
          "qtitle" => "New Shopping Cart Question",
          "row" => "r3",
          "rowTitle" => "[Software ™ Professional © Edition] Upload Image",
          "title" => "Quantity - [Software ™ Professional © Edition] Upload Image - New Shopping Cart Question",
          "type" => "text",
          "vgroup" => "q23r3"
        },
        %{
          "col" => "c2",
          "colTitle" => "Click Order",
          "label" => "q23r3c2",
          "qlabel" => "q23",
          "qtitle" => "New Shopping Cart Question",
          "row" => "r3",
          "rowTitle" => "[Software ™ Professional © Edition] Upload Image",
          "title" => "Click Order - [Software ™ Professional © Edition] Upload Image - New Shopping Cart Question",
          "type" => "text",
          "vgroup" => "q23r3"
        },
        %{
          "col" => "c3",
          "colTitle" => "Seconds Viewed",
          "label" => "q23r3c3",
          "qlabel" => "q23",
          "qtitle" => "New Shopping Cart Question",
          "row" => "r3",
          "rowTitle" => "[Software ™ Professional © Edition] Upload Image",
          "title" => "Seconds Viewed - [Software ™ Professional © Edition] Upload Image - New Shopping Cart Question",
          "type" => "text",
          "vgroup" => "q23r3"
        },
        %{
          "col" => "c1",
          "colTitle" => "Quantity",
          "label" => "q23r4c1",
          "qlabel" => "q23",
          "qtitle" => "New Shopping Cart Question",
          "row" => "r4",
          "rowTitle" => "[Software ™ Corporate © Edition] Upload Image",
          "title" => "Quantity - [Software ™ Corporate © Edition] Upload Image - New Shopping Cart Question",
          "type" => "text",
          "vgroup" => "q23r4"
        },
        %{
          "col" => "c2",
          "colTitle" => "Click Order",
          "label" => "q23r4c2",
          "qlabel" => "q23",
          "qtitle" => "New Shopping Cart Question",
          "row" => "r4",
          "rowTitle" => "[Software ™ Corporate © Edition] Upload Image",
          "title" => "Click Order - [Software ™ Corporate © Edition] Upload Image - New Shopping Cart Question",
          "type" => "text",
          "vgroup" => "q23r4"
        },
        %{
          "col" => "c3",
          "colTitle" => "Seconds Viewed",
          "label" => "q23r4c3",
          "qlabel" => "q23",
          "qtitle" => "New Shopping Cart Question",
          "row" => "r4",
          "rowTitle" => "[Software ™ Corporate © Edition] Upload Image",
          "title" => "Seconds Viewed - [Software ™ Corporate © Edition] Upload Image - New Shopping Cart Question",
          "type" => "text",
          "vgroup" => "q23r4"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q24r1",
          "qlabel" => "q24",
          "qtitle" => "New Card Sort Single Select Question",
          "row" => "r1",
          "rowTitle" => "Card 1",
          "title" => "Card 1 - New Card Sort Single Select Question",
          "type" => "single",
          "values" => [
            %{"title" => "Bucket 1", "value" => 1},
            %{"title" => "Bucket 2", "value" => 2},
            %{"title" => "Bucket 3", "value" => 3}
          ],
          "vgroup" => "q24"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q24r2",
          "qlabel" => "q24",
          "qtitle" => "New Card Sort Single Select Question",
          "row" => "r2",
          "rowTitle" => "Card 2",
          "title" => "Card 2 - New Card Sort Single Select Question",
          "type" => "single",
          "values" => [
            %{"title" => "Bucket 1", "value" => 1},
            %{"title" => "Bucket 2", "value" => 2},
            %{"title" => "Bucket 3", "value" => 3}
          ],
          "vgroup" => "q24"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q24r3",
          "qlabel" => "q24",
          "qtitle" => "New Card Sort Single Select Question",
          "row" => "r3",
          "rowTitle" => "Card 3",
          "title" => "Card 3 - New Card Sort Single Select Question",
          "type" => "single",
          "values" => [
            %{"title" => "Bucket 1", "value" => 1},
            %{"title" => "Bucket 2", "value" => 2},
            %{"title" => "Bucket 3", "value" => 3}
          ],
          "vgroup" => "q24"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q25r1",
          "qlabel" => "q25",
          "qtitle" => "New 'This or That' Question",
          "row" => "r1",
          "rowTitle" => "Idea A",
          "title" => "Idea A - New 'This or That' Question",
          "type" => "single",
          "values" => [
            %{"title" => "Ex 1", "value" => 1},
            %{"title" => "Ex 2", "value" => 2},
            %{"title" => "Ex 3", "value" => 3},
            %{"title" => "Ex 4", "value" => 4},
            %{"title" => "Ex 5", "value" => 5}
          ],
          "vgroup" => "q25"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q25r2",
          "qlabel" => "q25",
          "qtitle" => "New 'This or That' Question",
          "row" => "r2",
          "rowTitle" => "Idea C",
          "title" => "Idea C - New 'This or That' Question",
          "type" => "single",
          "values" => [
            %{"title" => "Ex 1", "value" => 1},
            %{"title" => "Ex 2", "value" => 2},
            %{"title" => "Ex 3", "value" => 3},
            %{"title" => "Ex 4", "value" => 4},
            %{"title" => "Ex 5", "value" => 5}
          ],
          "vgroup" => "q25"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q25r3",
          "qlabel" => "q25",
          "qtitle" => "New 'This or That' Question",
          "row" => "r3",
          "rowTitle" => "Idea E",
          "title" => "Idea E - New 'This or That' Question",
          "type" => "single",
          "values" => [
            %{"title" => "Ex 1", "value" => 1},
            %{"title" => "Ex 2", "value" => 2},
            %{"title" => "Ex 3", "value" => 3},
            %{"title" => "Ex 4", "value" => 4},
            %{"title" => "Ex 5", "value" => 5}
          ],
          "vgroup" => "q25"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q25r4",
          "qlabel" => "q25",
          "qtitle" => "New 'This or That' Question",
          "row" => "r4",
          "rowTitle" => "Idea G",
          "title" => "Idea G - New 'This or That' Question",
          "type" => "single",
          "values" => [
            %{"title" => "Ex 1", "value" => 1},
            %{"title" => "Ex 2", "value" => 2},
            %{"title" => "Ex 3", "value" => 3},
            %{"title" => "Ex 4", "value" => 4},
            %{"title" => "Ex 5", "value" => 5}
          ],
          "vgroup" => "q25"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q25_normr1_l",
          "qlabel" => "q25_norm",
          "qtitle" => "New 'This or That' Question - NORMALIZED",
          "row" => "r1_l",
          "rowTitle" => "Idea A",
          "title" => "Idea A - New 'This or That' Question - NORMALIZED",
          "type" => "single",
          "values" => [
            %{"title" => "Ex 1", "value" => 1},
            %{"title" => "Ex 2", "value" => 2},
            %{"title" => "Ex 3", "value" => 3},
            %{"title" => "Ex 4", "value" => 4},
            %{"title" => "Ex 5", "value" => 5}
          ],
          "vgroup" => "q25_norm"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q25_normr1_r",
          "qlabel" => "q25_norm",
          "qtitle" => "New 'This or That' Question - NORMALIZED",
          "row" => "r1_r",
          "rowTitle" => "Idea B",
          "title" => "Idea B - New 'This or That' Question - NORMALIZED",
          "type" => "single",
          "values" => [
            %{"title" => "Ex 1", "value" => 1},
            %{"title" => "Ex 2", "value" => 2},
            %{"title" => "Ex 3", "value" => 3},
            %{"title" => "Ex 4", "value" => 4},
            %{"title" => "Ex 5", "value" => 5}
          ],
          "vgroup" => "q25_norm"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q25_normr2_l",
          "qlabel" => "q25_norm",
          "qtitle" => "New 'This or That' Question - NORMALIZED",
          "row" => "r2_l",
          "rowTitle" => "Idea C",
          "title" => "Idea C - New 'This or That' Question - NORMALIZED",
          "type" => "single",
          "values" => [
            %{"title" => "Ex 1", "value" => 1},
            %{"title" => "Ex 2", "value" => 2},
            %{"title" => "Ex 3", "value" => 3},
            %{"title" => "Ex 4", "value" => 4},
            %{"title" => "Ex 5", "value" => 5}
          ],
          "vgroup" => "q25_norm"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q25_normr2_r",
          "qlabel" => "q25_norm",
          "qtitle" => "New 'This or That' Question - NORMALIZED",
          "row" => "r2_r",
          "rowTitle" => "Idea D",
          "title" => "Idea D - New 'This or That' Question - NORMALIZED",
          "type" => "single",
          "values" => [
            %{"title" => "Ex 1", "value" => 1},
            %{"title" => "Ex 2", "value" => 2},
            %{"title" => "Ex 3", "value" => 3},
            %{"title" => "Ex 4", "value" => 4},
            %{"title" => "Ex 5", "value" => 5}
          ],
          "vgroup" => "q25_norm"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q25_normr3_l",
          "qlabel" => "q25_norm",
          "qtitle" => "New 'This or That' Question - NORMALIZED",
          "row" => "r3_l",
          "rowTitle" => "Idea E",
          "title" => "Idea E - New 'This or That' Question - NORMALIZED",
          "type" => "single",
          "values" => [
            %{"title" => "Ex 1", "value" => 1},
            %{"title" => "Ex 2", "value" => 2},
            %{"title" => "Ex 3", "value" => 3},
            %{"title" => "Ex 4", "value" => 4},
            %{"title" => "Ex 5", "value" => 5}
          ],
          "vgroup" => "q25_norm"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q25_normr3_r",
          "qlabel" => "q25_norm",
          "qtitle" => "New 'This or That' Question - NORMALIZED",
          "row" => "r3_r",
          "rowTitle" => "Idea F",
          "title" => "Idea F - New 'This or That' Question - NORMALIZED",
          "type" => "single",
          "values" => [
            %{"title" => "Ex 1", "value" => 1},
            %{"title" => "Ex 2", "value" => 2},
            %{"title" => "Ex 3", "value" => 3},
            %{"title" => "Ex 4", "value" => 4},
            %{"title" => "Ex 5", "value" => 5}
          ],
          "vgroup" => "q25_norm"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q25_normr4_l",
          "qlabel" => "q25_norm",
          "qtitle" => "New 'This or That' Question - NORMALIZED",
          "row" => "r4_l",
          "rowTitle" => "Idea G",
          "title" => "Idea G - New 'This or That' Question - NORMALIZED",
          "type" => "single",
          "values" => [
            %{"title" => "Ex 1", "value" => 1},
            %{"title" => "Ex 2", "value" => 2},
            %{"title" => "Ex 3", "value" => 3},
            %{"title" => "Ex 4", "value" => 4},
            %{"title" => "Ex 5", "value" => 5}
          ],
          "vgroup" => "q25_norm"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q25_normr4_r",
          "qlabel" => "q25_norm",
          "qtitle" => "New 'This or That' Question - NORMALIZED",
          "row" => "r4_r",
          "rowTitle" => "Idea H",
          "title" => "Idea H - New 'This or That' Question - NORMALIZED",
          "type" => "single",
          "values" => [
            %{"title" => "Ex 1", "value" => 1},
            %{"title" => "Ex 2", "value" => 2},
            %{"title" => "Ex 3", "value" => 3},
            %{"title" => "Ex 4", "value" => 4},
            %{"title" => "Ex 5", "value" => 5}
          ],
          "vgroup" => "q25_norm"
        },
        %{
          "col" => "c1",
          "colTitle" => "Good",
          "label" => "q28r1c1",
          "qlabel" => "q28",
          "qtitle" => "Pick all that apply",
          "row" => "r1",
          "rowTitle" => "Apple",
          "title" => "Good - Apple - Pick all that apply",
          "type" => "multiple",
          "vgroup" => "q28r1"
        },
        %{
          "col" => "c2",
          "colTitle" => "Bad",
          "label" => "q28r1c2",
          "qlabel" => "q28",
          "qtitle" => "Pick all that apply",
          "row" => "r1",
          "rowTitle" => "Apple",
          "title" => "Bad - Apple - Pick all that apply",
          "type" => "multiple",
          "vgroup" => "q28r1"
        },
        %{
          "col" => "c3",
          "colTitle" => "Ugly",
          "label" => "q28r1c3",
          "qlabel" => "q28",
          "qtitle" => "Pick all that apply",
          "row" => "r1",
          "rowTitle" => "Apple",
          "title" => "Ugly - Apple - Pick all that apply",
          "type" => "multiple",
          "vgroup" => "q28r1"
        },
        %{
          "col" => "c1",
          "colTitle" => "Good",
          "label" => "q28r2c1",
          "qlabel" => "q28",
          "qtitle" => "Pick all that apply",
          "row" => "r2",
          "rowTitle" => "Orange",
          "title" => "Good - Orange - Pick all that apply",
          "type" => "multiple",
          "vgroup" => "q28r2"
        },
        %{
          "col" => "c2",
          "colTitle" => "Bad",
          "label" => "q28r2c2",
          "qlabel" => "q28",
          "qtitle" => "Pick all that apply",
          "row" => "r2",
          "rowTitle" => "Orange",
          "title" => "Bad - Orange - Pick all that apply",
          "type" => "multiple",
          "vgroup" => "q28r2"
        },
        %{
          "col" => "c3",
          "colTitle" => "Ugly",
          "label" => "q28r2c3",
          "qlabel" => "q28",
          "qtitle" => "Pick all that apply",
          "row" => "r2",
          "rowTitle" => "Orange",
          "title" => "Ugly - Orange - Pick all that apply",
          "type" => "multiple",
          "vgroup" => "q28r2"
        },
        %{
          "col" => "c1",
          "colTitle" => "Good",
          "label" => "q28r3c1",
          "qlabel" => "q28",
          "qtitle" => "Pick all that apply",
          "row" => "r3",
          "rowTitle" => "Banana",
          "title" => "Good - Banana - Pick all that apply",
          "type" => "multiple",
          "vgroup" => "q28r3"
        },
        %{
          "col" => "c2",
          "colTitle" => "Bad",
          "label" => "q28r3c2",
          "qlabel" => "q28",
          "qtitle" => "Pick all that apply",
          "row" => "r3",
          "rowTitle" => "Banana",
          "title" => "Bad - Banana - Pick all that apply",
          "type" => "multiple",
          "vgroup" => "q28r3"
        },
        %{
          "col" => "c3",
          "colTitle" => "Ugly",
          "label" => "q28r3c3",
          "qlabel" => "q28",
          "qtitle" => "Pick all that apply",
          "row" => "r3",
          "rowTitle" => "Banana",
          "title" => "Ugly - Banana - Pick all that apply",
          "type" => "multiple",
          "vgroup" => "q28r3"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q29r1",
          "qlabel" => "q29",
          "qtitle" => "Rank these OSes",
          "row" => "r1",
          "rowTitle" => "Linux",
          "title" => "Linux - Rank these OSes",
          "type" => "single",
          "values" => [
            %{"title" => "Best", "value" => 1},
            %{"title" => "Okay", "value" => 2},
            %{"title" => "Worst", "value" => 3},
            %{
              "title" => "Perhaps will bring about the end of life as we know it",
              "value" => 4
            }
          ],
          "vgroup" => "q29"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q29r2",
          "qlabel" => "q29",
          "qtitle" => "Rank these OSes",
          "row" => "r2",
          "rowTitle" => "Windows",
          "title" => "Windows - Rank these OSes",
          "type" => "single",
          "values" => [
            %{"title" => "Best", "value" => 1},
            %{"title" => "Okay", "value" => 2},
            %{"title" => "Worst", "value" => 3},
            %{
              "title" => "Perhaps will bring about the end of life as we know it",
              "value" => 4
            }
          ],
          "vgroup" => "q29"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q29r3",
          "qlabel" => "q29",
          "qtitle" => "Rank these OSes",
          "row" => "r3",
          "rowTitle" => "BSD",
          "title" => "BSD - Rank these OSes",
          "type" => "single",
          "values" => [
            %{"title" => "Best", "value" => 1},
            %{"title" => "Okay", "value" => 2},
            %{"title" => "Worst", "value" => 3},
            %{
              "title" => "Perhaps will bring about the end of life as we know it",
              "value" => 4
            }
          ],
          "vgroup" => "q29"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q29r4",
          "qlabel" => "q29",
          "qtitle" => "Rank these OSes",
          "row" => "r4",
          "rowTitle" => "Unix",
          "title" => "Unix - Rank these OSes",
          "type" => "single",
          "values" => [
            %{"title" => "Best", "value" => 1},
            %{"title" => "Okay", "value" => 2},
            %{"title" => "Worst", "value" => 3},
            %{
              "title" => "Perhaps will bring about the end of life as we know it",
              "value" => 4
            }
          ],
          "vgroup" => "q29"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q31r1",
          "qlabel" => "q31",
          "qtitle" => "Rate yourself",
          "row" => "r1",
          "rowTitle" => "Points",
          "title" => "Rate yourself",
          "type" => "number",
          "vgroup" => "q31"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q30r1",
          "qlabel" => "q30",
          "qtitle" => "Rate different aspects of the TV show Legion",
          "row" => "r1",
          "rowTitle" => "Cinematagraphy",
          "title" => "Cinematagraphy - Rate different aspects of the TV show Legion",
          "type" => "number",
          "vgroup" => "q30"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q30r2",
          "qlabel" => "q30",
          "qtitle" => "Rate different aspects of the TV show Legion",
          "row" => "r2",
          "rowTitle" => "Acting",
          "title" => "Acting - Rate different aspects of the TV show Legion",
          "type" => "number",
          "vgroup" => "q30"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q30r3",
          "qlabel" => "q30",
          "qtitle" => "Rate different aspects of the TV show Legion",
          "row" => "r3",
          "rowTitle" => "Soundtrack",
          "title" => "Soundtrack - Rate different aspects of the TV show Legion",
          "type" => "number",
          "vgroup" => "q30"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q21",
          "qlabel" => "q21",
          "qtitle" => "How do you feel about the state of the world",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "How do you feel about the state of the world",
          "type" => "single",
          "values" => [
            %{"title" => "Horrible", "value" => 1},
            %{"title" => "Slight better than horrible", "value" => 2},
            %{"title" => "Awful", "value" => 3},
            %{"title" => "Numb", "value" => 4},
            %{"title" => "Okay", "value" => 5},
            %{"title" => "Better than okay", "value" => 6},
            %{"title" => "Great", "value" => 7}
          ],
          "vgroup" => "q21"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q32r1",
          "qlabel" => "q32",
          "qtitle" => "Rate your best friend.",
          "row" => "r1",
          "rowTitle" => "Points",
          "title" => "Rate your best friend.",
          "type" => "float",
          "vgroup" => "q32"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q35",
          "qlabel" => "q35",
          "qtitle" => "Upload a random image",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Upload a random image",
          "type" => "text",
          "vgroup" => "q35"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "noanswerq35_na_q35",
          "noanswerParent" => "q35",
          "qlabel" => "noanswer",
          "qtitle" => "No Answer",
          "row" => "q35_na_q35",
          "rowTitle" => "Upload a random image: NA",
          "title" => "Upload a random image: NA - No Answer",
          "type" => "multiple",
          "vgroup" => "noanswer"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q36r1",
          "qlabel" => "q36",
          "qtitle" => "Highlight&nbsp;parts you like, don't like, and don't care about",
          "row" => "r1",
          "rowTitle" => "Ponds are frequently human-constructed. In the countryside farmers and villagers dig a pond in their backyard or increase the depth of an existing pond by removing layers of mud during summer season. A wide variety of artificial bodies of water are classified as ponds. Some ponds are created specifically for habitat restoration, including water treatment. Others, likewater gardens, water features and koi ponds are designed for aesthetic ornamentation as landscape or architectural features.Fish pondsare designed for commercial fish breeding, andsolar pondsdesigned to store thermal energy.Treatment pondsare used to treatwastewater.",
          "title" => "Ponds are frequently human-constructed. In the countryside farmers and villagers dig a pond in their backyard or increase the depth of an existing pond by removing layers of mud during summer season. A wide variety of artificial bodies of water are classified as ponds. Some ponds are created specifically for habitat restoration, including water treatment. Others, likewater gardens, water features and koi ponds are designed for aesthetic ornamentation as landscape or architectural features.Fish pondsare designed for commercial fish breeding, andsolar pondsdesigned to store thermal energy.Treatment pondsare used to treatwastewater. - Highlight&nbsp;parts you like, don't like, and don't care about",
          "type" => "single",
          "values" => [
            %{"title" => "Like", "value" => 1},
            %{"title" => "Don't Like", "value" => 2},
            %{"title" => "Don't Care", "value" => 3}
          ],
          "vgroup" => "q36"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q36r2",
          "qlabel" => "q36",
          "qtitle" => "Highlight&nbsp;parts you like, don't like, and don't care about",
          "row" => "r2",
          "rowTitle" => "Standing bodies of water such aspuddles, ponds, and lakes are often categorized separately from flowing water courses, such as brooks, creeks, streams or rivers. Nutrient levels and water quality in ponds can be controlled through natural process such as algal growth, or through artificial filtration, such as analgae scrubber.",
          "title" => "Standing bodies of water such aspuddles, ponds, and lakes are often categorized separately from flowing water courses, such as brooks, creeks, streams or rivers. Nutrient levels and water quality in ponds can be controlled through natural process such as algal growth, or through artificial filtration, such as analgae scrubber. - Highlight&nbsp;parts you like, don't like, and don't care about",
          "type" => "single",
          "values" => [
            %{"title" => "Like", "value" => 1},
            %{"title" => "Don't Like", "value" => 2},
            %{"title" => "Don't Care", "value" => 3}
          ],
          "vgroup" => "q36"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q37",
          "qlabel" => "q37",
          "qtitle" => "Record a video testimonial",
          "row" => nil,
          "rowTitle" => nil,
          "title" => "Record a video testimonial",
          "type" => "text",
          "vgroup" => "q37"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "noanswerq37_na_q37",
          "noanswerParent" => "q37",
          "qlabel" => "noanswer",
          "qtitle" => "No Answer",
          "row" => "q37_na_q37",
          "rowTitle" => "Record a video testimonial: NA",
          "title" => "Record a video testimonial: NA - No Answer",
          "type" => "multiple",
          "vgroup" => "noanswer"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q39play_count",
          "qlabel" => "q39",
          "qtitle" => "How do you feel about this theft?",
          "row" => "play_count",
          "rowTitle" => "Play Count",
          "title" => "Play Count - How do you feel about this theft?",
          "type" => "text",
          "vgroup" => "q39"
        },
        %{
          "col" => nil,
          "colTitle" => nil,
          "label" => "q39time_elapsed",
          "qlabel" => "q39",
          "qtitle" => "How do you feel about this theft?",
          "row" => "time_elapsed",
          "rowTitle" => "Elapsed Time",
          "title" => "Elapsed Time - How do you feel about this theft?",
          "type" => "text",
          "vgroup" => "q39"
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

  def metadata do
    %DecipherAPI.Datamap{
              questions: [
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
              survey_id: "something/444/something",
              variables: [
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
                  "values" => [
                    %{"title" => "Open Survey (list=0)", "value" => 1}
                  ],
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

  def coerced_metadata do
    %DecipherAPI.Datamap{survey_id: "something/444/something", questions: %{"q1" => %DecipherAPI.Datamap.Question{grouping: "rows", qlabel: "q1", qtitle: "What's your number?", type: "number", values: nil, variables: [%DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "q1", qlabel: "q1", qtitle: "What's your number?", row: nil, row_title: nil, title: "What's your number?", type: "number", values: nil, vgroup: "q1"}]}, "qtime" => %DecipherAPI.Datamap.Question{grouping: "rows", qlabel: "qtime", qtitle: "Total Interview Time", type: "float", values: nil, variables: [%DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "qtime", qlabel: "qtime", qtitle: "Total Interview Time", row: nil, row_title: nil, title: "Total Interview Time", type: "float", values: nil, vgroup: "qtime"}]}, "start_date" => %DecipherAPI.Datamap.Question{grouping: "rows", qlabel: "start_date", qtitle: "Survey start time", type: "text", values: nil, variables: [%DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "start_date", qlabel: "start_date", qtitle: "Survey start time", row: nil, row_title: nil, title: "Survey start time", type: "text", values: nil, vgroup: "start_date"}]}, "q2" => %DecipherAPI.Datamap.Question{grouping: "cols", qlabel: "q2", qtitle: "Pizza?", type: "single", values: %{1 => "Yes", 2 => "No", 3 => "I hate it", 4 => "I guess"}, variables: [%DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "q2", qlabel: "q2", qtitle: "Pizza?", row: nil, row_title: nil, title: "Pizza?", type: "single", vgroup: "q2", values: %{1 => "Yes", 2 => "No", 3 => "I hate it", 4 => "I guess"}}]}}, variables: [%DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "record", qlabel: nil, qtitle: "Record number", row: nil, row_title: nil, title: "Record number", type: "text", values: nil, vgroup: "record"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "uuid", qlabel: nil, qtitle: "Respondent identifier", row: nil, row_title: nil, title: "Respondent identifier", type: "text", values: nil, vgroup: "uuid"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "date", qlabel: nil, qtitle: "Completion time and date", row: nil, row_title: nil, title: "Completion time and date", type: "text", values: nil, vgroup: "date"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "markers", qlabel: nil, qtitle: "Acquired markers", row: nil, row_title: nil, title: "Acquired markers", type: "text", values: nil, vgroup: "markers"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "status", qlabel: "status", qtitle: "Respondent status", row: nil, row_title: nil, title: "Respondent status", type: "single", vgroup: "status", values: %{1 => "Terminated", 2 => "Overquota", 3 => "Qualified", 4 => "Partial"}}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "q1", qlabel: "q1", qtitle: "What's your number?", row: nil, row_title: nil, title: "What's your number?", type: "number", values: nil, vgroup: "q1"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "q2", qlabel: "q2", qtitle: "Pizza?", row: nil, row_title: nil, title: "Pizza?", type: "single", vgroup: "q2", values: %{1 => "Yes", 2 => "No", 3 => "I hate it", 4 => "I guess"}}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "vlist", qlabel: "vlist", qtitle: "Sample source", row: nil, row_title: nil, title: "Sample source", type: "single", vgroup: "vlist", values: %{1 => "Open Survey (list=0)"}}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "qtime", qlabel: "qtime", qtitle: "Total Interview Time", row: nil, row_title: nil, title: "Total Interview Time", type: "float", values: nil, vgroup: "qtime"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "vos", qlabel: "vos", qtitle: "Operating System", row: nil, row_title: nil, title: "Operating System", type: "single", vgroup: "vos", values: %{1 => "Windows 95", 2 => "Windows 98", 3 => "Windows 8", 4 => "Windows 10", 5 => "Windows 7", 6 => "Windows Vista", 7 => "Windows 2003", 8 => "Windows XP", 9 => "Windows 2000", 10 => "Microsoft Windows NT 4.0", 11 => "Windows ME", 12 => "iPhone/iPad", 13 => "Mac OS X or older", 14 => "Other Mobile", 15 => "Linux, UNIX", 16 => "Other"}}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "vosr15oe", qlabel: "vos", qtitle: "Operating System", row: "r15", row_title: "Other", title: "Operating System - Other", type: "text", values: nil, vgroup: "vosr15oe"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "vbrowser", qlabel: "vbrowser", qtitle: "Browser", row: nil, row_title: nil, title: "Browser", type: "single", vgroup: "vbrowser", values: %{1 => "Opera", 2 => "MS Edge", 3 => "MSIE 11", 4 => "MSIE 10.x", 5 => "MSIE 9.x", 6 => "MSIE 8.x", 7 => "MSIE 7.x", 8 => "MSIE 6.x", 9 => "MSIE 5.x or older", 10 => "Chrome", 11 => "Safari", 12 => "Firefox", 13 => "Other Mozilla or Netscape", 14 => "Mobile", 15 => "Text Browser", 16 => "Other"}}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "vbrowserr15oe", qlabel: "vbrowser", qtitle: "Browser", row: "r15", row_title: "Other", title: "Browser - Other", type: "text", values: nil, vgroup: "vbrowserr15oe"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "vmobiledevice", qlabel: "vmobiledevice", qtitle: "Mobile device category", row: nil, row_title: nil, title: "Mobile device category", type: "single", vgroup: "vmobiledevice", values: %{1 => "Smartphone", 2 => "Featurephone", 3 => "Tablet", 4 => "Other mobile", 5 => "Desktop"}}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "vmobileos", qlabel: "vmobileos", qtitle: "Mobile OS", row: nil, row_title: nil, title: "Mobile OS", type: "single", vgroup: "vmobileos", values: %{1 => "iOS", 2 => "Android", 3 => "Symbian", 4 => "Windows Phone", 5 => "Blackberry", 6 => "Other/Desktop"}}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "start_date", qlabel: "start_date", qtitle: "Survey start time", row: nil, row_title: nil, title: "Survey start time", type: "text", values: nil, vgroup: "start_date"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "source", qlabel: nil, qtitle: "Captured variable", row: nil, row_title: nil, title: "Captured variable", type: "text", values: nil, vgroup: "source"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "ipAddress", qlabel: nil, qtitle: "Captured variable", row: nil, row_title: nil, title: "Captured variable", type: "text", values: nil, vgroup: "ipAddress"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "decLang", qlabel: nil, qtitle: "Captured variable", row: nil, row_title: nil, title: "Captured variable", type: "text", values: nil, vgroup: "decLang"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "list", qlabel: nil, qtitle: "Captured variable", row: nil, row_title: nil, title: "Captured variable", type: "text", values: nil, vgroup: "list"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "userAgent", qlabel: nil, qtitle: "Captured variable", row: nil, row_title: nil, title: "Captured variable", type: "text", values: nil, vgroup: "userAgent"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "dcua", qlabel: nil, qtitle: "Captured variable", row: nil, row_title: nil, title: "Captured variable", type: "text", values: nil, vgroup: "dcua"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "session", qlabel: nil, qtitle: "Captured variable", row: nil, row_title: nil, title: "Captured variable", type: "text", values: nil, vgroup: "session"}, %DecipherAPI.Datamap.Variables{col: nil, col_title: nil, label: "url", qlabel: nil, qtitle: "Captured variable", row: nil, row_title: nil, title: "Captured variable", type: "text", values: nil, vgroup: "url"}]}
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
