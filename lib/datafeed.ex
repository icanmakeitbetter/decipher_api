defmodule Datafeed do

  @spec reset(String.t) :: any
  def reset(survey_id, func \\ &API.reset_datafeed/1) when is_binary(survey_id) do
    func.(survey_id)
  end
end
