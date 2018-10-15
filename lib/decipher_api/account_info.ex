defmodule DecipherAPI.AccountInfo do
  alias __MODULE__

  defstruct(
    api_key: nil,
    domain: nil,
    survey_url_prefix: nil
  )

  @spec new(map()) :: %AccountInfo{}
  def new(account_info) when account_info |> is_map() do
    %{
      %AccountInfo{} |
      api_key: account_info["api_key"],
      domain: remove_slashes(account_info["domain"]),
      survey_url_prefix: remove_slashes(account_info["survey_url_prefix"]),
    }
  end

  @spec remove_slashes(String.t) :: String.t
  defp remove_slashes(url) when url |> is_binary() do
    url
    |> remove_leading_slashes(String.first(url))
    |> remove_trailing_slashes(String.last(url))
  end

  defp remove_leading_slashes(url, "/") do
    new_url = String.slice(url, 1, String.length(url))
    remove_leading_slashes(new_url, String.first(new_url))
  end

  defp remove_leading_slashes(url, _), do: url

  defp remove_trailing_slashes(url, "/") do
    new_url = String.slice(url, 0, String.length(url) - 1)
    remove_trailing_slashes(new_url, String.last(new_url))
  end

  defp remove_trailing_slashes(url, _), do: url

end
