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

  @spec coerce_answers(%{}, nil) :: %{}
  def coerce_answers(answer_map, nil) do
    answer_map
  end

  @spec coerce_answers(%{}, %Datamap{}) :: %{}
  def coerce_answers(answer_map, datamap) do

    Enum.reduce(answer_map, Map.new(), fn({answer_map_key, value}, final_mapping) ->

      question =
        datamap.variables
        |> Enum.find(
          fn [variable_key, _question] ->
            variable_key == answer_map_key
          end)
        |> Enum.at(1)

      case question.type do
        "single" ->
          Map.put(final_mapping,
            answer_map_key,
            question.values
              |> Enum.find(
                  fn([key, _answer]) ->
                     key == String.to_integer(value)
                  end)
              |> Enum.at(1)
          )
        "multiple" ->
          if value == "1" do
            Map.put(final_mapping, answer_map_key, value)
          else
            final_mapping
          end
        "number" ->
          Map.put(final_mapping, answer_map_key, String.to_integer(value))
        "float" ->
          Map.put(final_mapping, answer_map_key, String.to_float(value))
        "text" ->
          Map.put(final_mapping, answer_map_key, value)
        _other ->
          Map.put(final_mapping, answer_map_key, value)
      end
    end)
  end

  # TODO: do we need to handle a nil date?
  def format_date(date) when is_binary(date) do
    String.replace(date,
      ~r<\A(\d{2})/(\d{2})/(\d{4})\s(\d{2}:\d{2})\z>, "\\3-\\1-\\2T\\4:00")
    |> NaiveDateTime.from_iso8601!
  end
end
