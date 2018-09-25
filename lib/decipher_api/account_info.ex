defmodule DecipherAPI.AccountInfo do
  alias __MODULE__

  defstruct(
    api_key: nil,
    domain: nil,
    survey_url_prefix: nil
  )

  def new(account_info) when account_info |> is_map() do
    %{
      %AccountInfo{} |
      api_key: account_info["api_key"],
      domain: account_info["domain"],
      survey_url_prefix: account_info["survey_url_prefix"],
    }
  end
end
