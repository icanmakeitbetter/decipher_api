defmodule Datafeed do

  def reset(survey_id, func \\ &API.reset_datafeed/1) do
    func.(survey_id)
  end
end
