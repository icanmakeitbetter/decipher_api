defmodule Datafeed do
  defstruct paths: []

  def new do
    %Datafeed{}
  end

  def reset() do
    API.reset_datafeed()
  end
end
