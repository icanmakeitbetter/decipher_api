defmodule DecipherAPITest do
  alias DecipherAPI.Service.HTTPClient
  use ExUnit.Case, async: true

  test "that the get! function is there" do
    api_call = fn _, _, _ ->
      send self(), :api_call
    end

    HTTPClient.get!("selfserve/555/survey1", [], api_call)

    assert_received :api_call
  end

  test "that the post! function is there" do
    api_call = fn _, _, _ ->
      send self(), :api_call
    end

    HTTPClient.post!("{}", "selfserve/555/survey1", [], api_call)

    assert_received :api_call
  end

  test "that the delete! function is there" do
    api_call = fn _, _ ->
      send self(), :api_call
    end

    HTTPClient.delete!("selfserve/555/survey1", [], api_call)

    assert_received :api_call
  end
end
