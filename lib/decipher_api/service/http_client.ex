defmodule DecipherAPI.Service.HTTPClient do
  @moduledoc """
  Provides testable functions that actually call out via HTTP to the API.
  """

  @spec get!(binary(), list(), fun()) :: %HTTPoison.Response{}
  def get!(endpoint, api_headers, func \\ &HTTPoison.get!/3) do
    func.(endpoint, api_headers, [timeout: 450_000, recv_timeout: 450_000])
  end

  @spec post(binary(), binary(), list(), fun()) ::
    {:ok, HTTPoison.Response.t() | HTTPoison.AsyncResponse.t()}
    | {:error, HTTPoison.Error.t()}
  def post(body, endpoint, api_headers, func \\ &HTTPoison.post/3) do
    func.(body, endpoint, api_headers)
  end

  @spec delete!(binary(), list(), fun()) :: %HTTPoison.Response{}
  def delete!(endpoint, api_headers, func \\ &HTTPoison.delete!/2) do
    func.(endpoint, api_headers)
  end

  def put(body, endpoint, api_headers, func \\ &HTTPoison.put/3) do
    func.(body, endpoint, api_headers)
  end
end
