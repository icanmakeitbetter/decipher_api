defmodule Datafeed do
  defstruct paths: []

  def new do
    %Datafeed{}
  end

  # def fetch_new_answers(datafeed_struct, options = {}) do
  # end
  #
  # def each(datafeed_struct, func) do
  # end
  # 
  def reset() do
    API.reset_datafeed()
  end
end
