defmodule DecipherAPI.Datafeed.Result do
  alias __MODULE__

  defstruct(
    survey_url: "",
    date: nil,
    uuid: nil,
    answers: %{},
    raw_result: %{}
  )

  @spec new() :: %Result{}
  def new do
    %Result{}
  end

  @spec coerce_data(%{}) :: struct
  def coerce_data(result) when is_map(result) do
    %{
      new() |
      survey_url: result["$survey"],
      date: format_date(result["date"]),
      uuid: result["uuid"],
      answers: get_answers(result),
      raw_result: result
    }
  end

  @spec get_answers(%{}) :: struct
  def get_answers(result) when is_map(result) do
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

  # TODO: do we need to handle a nil date?
  def format_date(date) when is_binary(date) do
    String.replace(date,
      ~r<\A(\d{2})/(\d{2})/(\d{4})\s(\d{2}:\d{2})\z>, "\\3-\\1-\\2T\\4:00")
    |> NaiveDateTime.from_iso8601!
  end
end