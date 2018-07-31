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
      question_order: xml_metadata.ordering,
      questions: Question.coerce_maps(datamap.questions, xml_metadata.questions),
      variables: Variables.coerce_maps(datamap.variables),
      xml: xml_metadata
    }
  end

  @spec coerce_xml_metadata(String.t) :: %{}
  def coerce_xml_metadata(xml_metadata) when is_binary(xml_metadata) do

    ordering =
      xml_metadata
      |> xpath(~x"/survey/*"el)
      |> Enum.filter(fn
        {:xmlElement, :suspend, _, _, _, _, _, _, _, _, _, _} ->
          true
        {:xmlElement, _, _, _, _, _, _, attrs, _, _, _, _} ->
          Enum.any?(attrs, fn
            {:xmlAttribute, :label, _, _, _, _, _, _, _, _} ->
              true
            _attr ->
              false
          end)
        _node ->
          false
      end)
      |> Enum.map(fn
        {:xmlElement, :suspend, _, _, _, _, _, _, _, _, _, _} ->
          :page_break
        {:xmlElement, _, _, _, _, _, _, attrs, _, _, _, _} = node ->
          attrs
          |> Enum.into(Map.new, fn {:xmlAttribute, name, _, _, _, _, _, _, value, _} ->
            {name, to_string(value)}
          end)
          |> Map.put(:comment, node |> xpath(~x"comment/text()"s))
      end)
      |> Enum.chunk_by(fn question_or_break -> question_or_break == :page_break end)
      |> Enum.reject(fn
        [:page_break] ->
          true
        _page ->
          false
      end)

    questions =
      ordering
      |> List.flatten()
      |> Enum.into(%{}, fn(metadata) ->
        {Map.get(metadata, :label), metadata}
      end)

      %{
        name: xpath(xml_metadata, ~x"@alt") |> to_string,
        ordering: Enum.map(ordering, fn page -> Enum.map(page, fn question -> question.label end) end),
        questions: questions
      }
  end

end
