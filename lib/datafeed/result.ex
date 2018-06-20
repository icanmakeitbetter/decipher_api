defmodule Datafeed.Result do
  alias __MODULE__

  defstruct(
    survey_url: "",
    date: nil,
    uuid: nil,
    questions_answers: %{},
    raw_result: %{}
  )

  def new do
    %Result{}
  end

  @spec coerce_data(%{}) :: struct
  def coerce_data(result) do
    %{
      new() |
      survey_url: result["$survey"],
      date: format_date(result["date"]),
      uuid: result["uuid"],
      questions_answers: get_questions(result),
      raw_result: result
    }
  end

  @spec get_questions(%{}) :: struct
  def get_questions(result) do
    Map.drop(
      result,
      [
        "$survey",
        "date",
        "dcua",
        "ipAddress",
        "list",
        "markers",
        "qtime",
        "record",
        "session",
        "start_date",
        "status",
        "url",
        "userAgent",
        "uuid",
        "vbrowser",
        "vlist",
        "vmobiledevice",
        "vmobiledevice",
        "vmobileos",
        "vos"
      ]
    )
  end

  def format_date(date) do
    String.replace(date,
      ~r<\A(\d{2})/(\d{2})/(\d{4})\s(\d{2}:\d{2})\z>, "\\3-\\1-\\2T\\4:00")
    |> NaiveDateTime.from_iso8601!
  end
end
