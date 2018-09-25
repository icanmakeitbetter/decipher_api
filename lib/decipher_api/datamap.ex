defmodule DecipherAPI.Datamap do
  import SweetXml
  @moduledoc """
  How you get questions, question metadata, and metadata about a survey from Decipher.

  Provides functions for interacting with Decipher's datamap endpoint and coercing
  that data into something more useful.
  """
  alias DecipherAPI.AccountInfo
  alias DecipherAPI.Datamap.{Question, Variables}
  alias __MODULE__

  defstruct(
    account_info: nil,
    comments: nil,
    survey_id: nil,
    survey_name: nil,
    page_grouping: [],
    questions: %{},
    variables: %{},
    xml:       nil
  )

  @spec new(map(), binary()) :: %Datamap{}
  def new(account_info, survey_id) when is_map(account_info) do
    %{
      %Datamap{} |
      account_info: AccountInfo.new(account_info),
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
  def get_question_metadata(
      %Datamap{account_info: account_info, survey_id: survey_id} = datamap
    )
    when is_binary(survey_id) and is_map(account_info) do
    with {:ok, datamap_metadata} <-
            DecipherAPI.Service.get_datamap_metadata(account_info, survey_id),
         {:ok, xml_metadata}     <-
            DecipherAPI.Service.get_xml_metadata(account_info, survey_id)
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
      comments: xml_metadata.comments,
      survey_name: xml_metadata.name,
      page_grouping: xml_metadata.ordering,
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
        {:xmlElement, tag_name, _, _, _, _, _, attrs, _, _, _, _} = node ->
          attrs
          |> Enum.into(Map.new, fn {:xmlAttribute, name, _, _, _, _, _, _, value, _} ->
            {name, to_string(value)}
          end)
          |> Map.put(:comment, node |> xpath(~x"comment/text()"s))
          |> Map.put(:element_text, node |> xpath(~x"text()"s))
          |> Map.put(:tag_name, tag_name)
      end)
      |> Enum.chunk_by(fn question_or_break -> question_or_break == :page_break end)
      |> Enum.reject(fn
        [:page_break] ->
          true
        _page ->
          false
      end)

    elements =
      ordering
      |> List.flatten()
      |> Enum.into(%{}, fn(metadata) ->
        {Map.get(metadata, :label), metadata}
      end)

    questions =
      elements
      |> Enum.reject(fn({_k, v}) ->
        v.tag_name == :html
      end)
      |> Map.new()

    comments =
      elements
      |> Enum.filter(fn({_k, v}) ->
        v.tag_name == :html
      end)
      |> Map.new()

      %{
        comments: comments,
        name: xpath(xml_metadata, ~x"@alt") |> to_string,
        ordering: Enum.map(ordering, fn page -> Enum.map(page, fn question -> question.label end) end),
        questions: questions
      }
  end

end
