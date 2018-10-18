defmodule DecipherAPI.Datafeed.ResultSet.Result do
  alias DecipherAPI.Datamap
  alias __MODULE__

  defstruct(
    survey_url: nil,
    date: nil,
    uuid: nil,
    answers: nil,
    raw_result: nil
  )

  @metadata_fields ~w[
    $survey
    date
    dcua
    ipAddress
    list
    markers
    qtime
    record
    session
    start_date
    status
    url
    userAgent
    uuid
    vbrowser
    vlist
    vmobiledevice
    vmobiledevice
    vmobileos
    vos
  ]


  @spec new() :: %Result{}
  def new do
    %Result{}
  end

  @spec coerce_data(%{}) :: %Result{}
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

  @spec process_answers(%{}, %Datamap{} | nil) :: %{}
  def process_answers(result, datamap) do
    result
    |> get_answers()
    |> coerce_answers(datamap)
  end

  @doc """
  Leaves you with just the answers by dropping everything from the map save for
  'q1', 'q2', 'q3', etc.
  """
  @spec get_answers(%{}) :: %{}
  def get_answers(result) when is_map(result) do
    Map.drop(result, @metadata_fields)
  end

  @spec coerce_answers(%{}, nil) :: %{}
  def coerce_answers(answer_map, nil) do
    answer_map
  end

  # question, [row], choice/value/text
  # %{
  #   "q1" => "answer",
  #   "q2r1" => "other answer",
  #
  #   "q3r1c1" => "1",
  #   "q3r1c4" => "1",
  # }
  # [
  #   [%Variable{ }, answer (choice/value/text)],
  #   [%Variable{ }, answer (choice/value/text)],
  #   [%Variable{ }, answer (choice/value/text)],
  #   ...
  # ]
  @spec coerce_answers(%{}, %Datamap{}) :: %{}
  def coerce_answers(answer_map, datamap) do

    Enum.reduce(answer_map, [], fn({answer_map_key, value}, final_mapping) ->

      answer_key = Map.fetch!(datamap.variables, answer_map_key)

      case answer_key.type do
        "single" ->
          put_answer_and_key(
            final_mapping,
            answer_key,
            answer_key.values
              |> Enum.find(
                  fn([key, _answer]) ->
                     key == String.to_integer(value)
                  end)
              |> Enum.at(1)
          )
        "multiple" ->
          if value == "1" do
            put_answer_and_key(
              final_mapping,
              answer_key,
              answer_key.row_title
            )
          else
            final_mapping
          end
        "number" ->
          put_answer_and_key(
            final_mapping,
            answer_key,
            String.to_integer(value)
          )
        "float" ->
          put_answer_and_key(
            final_mapping,
            answer_key,
            String.to_float(value)
          )
        "text" ->
          put_answer_and_key(
            final_mapping,
            answer_key,
            value
          )
        _other ->
          put_answer_and_key(
            final_mapping,
            answer_key,
            value
          )
      end
    end)
  end

  @spec metadata(%{}) :: %{}
  def metadata(result) do
    Map.take(result, @metadata_fields)
  end

  @spec put_answer_and_key([], %DecipherAPI.Datamap.Variables{}, String.t | float() | integer() | atom()) :: [[]]
  defp put_answer_and_key(final_mapping, answer_key, value) do
    final_mapping ++ [[answer_key, value]]
  end

  # TODO: do we need to handle a nil date?
  @spec format_date(String.t) :: %NaiveDateTime{}
  def format_date(date) when is_binary(date) do
    String.replace(date,
      ~r<\A(\d{2})/(\d{2})/(\d{4})\s(\d{2}:\d{2})\z>, "\\3-\\1-\\2T\\4:00")
    |> NaiveDateTime.from_iso8601!
  end
end
