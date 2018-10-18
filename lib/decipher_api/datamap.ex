require IEx
defmodule DecipherAPI.Datamap do
  @moduledoc """
  How you get questions, question metadata, and metadata about a survey from Decipher.

  Provides functions for interacting with Decipher's datamap endpoint and coercing
  that data into something more useful.
  """
  alias DecipherAPI.AccountInfo
  alias DecipherAPI.Datamap.{Question, Variables, XMLParser}
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

  @spec build_metadata_set(%Datamap{}) :: %Datamap{} | {:error, String.t}
  def build_metadata_set(datamap) do
    datamap
    |> get_question_metadata()
    |> coerce_data()
  end

  @spec get_question_metadata(%Datamap{}) :: %Datamap{} | {:error, String.t}
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
    end
  end

  @spec coerce_data(%Datamap{} | {:error, String.t}) :: %Datamap{}
  def coerce_data(datamap) do
    case datamap do
      {:error, error} ->
        {:error, error}
      _ ->
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
  end

  @spec coerce_xml_metadata(String.t) :: %{comments: %{}, name: String.t, ordering: [[]], questions: %{}}
  def coerce_xml_metadata(xml_metadata) when is_binary(xml_metadata) do
    XMLParser.parse(xml_metadata)
  end

end
