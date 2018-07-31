defmodule DecipherAPI.Datamap do
  import SweetXml
  @moduledoc """
  How you get questions, question metadata, and metadata about a survey from Decipher.

  Provides functions for interacting with Decipher's datamap endpoint and coercing
  that data into something more useful.
  """
  alias DecipherAPI.Datamap.{Question, Variables}
  alias __MODULE__

  defstruct(
    survey_id: nil,
    survey_name: nil,
    question_order: [],
    questions: %{},
    variables: %{},
    xml:       nil
  )

  @spec new(binary()) :: %Datamap{}
  def new(survey_id) do
    %{
      %Datamap{} |
      survey_id: survey_id
    }
  end

  @spec build_metadata_set(%Datamap{}) :: %Datamap{}
  def build_metadata_set(datamap) do
    datamap
    |> get_question_metadata()
    |> coerce_data()
  end

  @spec get_question_metadata(%Datamap{}) :: %Datamap{}
  def get_question_metadata(%Datamap{survey_id: survey_id} = datamap) when is_binary(survey_id) do
    with {:ok, datamap_metadata} <- DecipherAPI.Service.get_datamap_metadata(survey_id),
         {:ok, xml_metadata}     <- DecipherAPI.Service.get_xml_metadata(survey_id)
      do
        %{
          datamap |
          question_order: Enum.map(datamap_metadata["questions"], fn question -> question["qlabel"] end),
          questions: datamap_metadata["questions"],
          variables: datamap_metadata["variables"],
          xml: xml_metadata
        }
      else
        {:error, reason} ->
          {:error, reason}
    end
  end

  @spec coerce_data(%Datamap{}) :: %Datamap{}
  def coerce_data(datamap) do
    xml_metadata = coerce_xml_metadata(datamap.xml)

    %{
      datamap |
      survey_name: xml_metadata.name,
      questions: Question.coerce_maps(datamap.questions, xml_metadata.questions),
      variables: Variables.coerce_maps(datamap.variables),
      xml: xml_metadata
    }
  end

  @spec coerce_xml_metadata(String.t) :: %{}
  def coerce_xml_metadata(xml_metadata) when is_binary(xml_metadata) do

    questions =
      xml_metadata
      |> xpath(~x"//*[@label]"el)
      |> Enum.map(fn node ->
        xpath(node, ~x"@*"el)
        |> Enum.map(fn{:xmlAttribute, name, _, _, _, _, _, _, value, _} -> {name, to_string(value)} end)
        |> Kernel.++([comment: xpath(node, ~x"comment/text()") |> to_string]) end)
        |> Enum.into(%{}, fn(metadata) ->
          {Keyword.get(metadata, :label), Map.new(metadata)}
        end)

      %{
        name: xpath(xml_metadata, ~x"@alt") |> to_string,
        questions: questions
      }
  end

end
