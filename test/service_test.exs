defmodule DecipherAPITest.ServiceTest do
  alias DecipherAPI.Service
  alias DecipherAPITest.Support.FakeData

  use ExUnit.Case, async: true

  defp assert_error(response) do
    assert Service.parse_response(response) |> elem(0) == :error
  end

  test "that 400 error returns an :error atom" do
    FakeData.response_status_code(400)
    |> assert_error
  end

  test "that 401 error returns an :error atom" do
    FakeData.response_status_code(401)
    |> assert_error
  end

  test "that 402 error returns an :error atom" do
    FakeData.response_status_code(402)
    |> assert_error
  end

  test "that 403 error returns an :error atom" do
    FakeData.response_status_code(403)
    |> assert_error
  end

  test "that 404 error returns an :error atom" do
    FakeData.response_status_code(404)
    |> assert_error
  end

  test "that 405 error returns an :error atom" do
    FakeData.response_status_code(405)
    |> assert_error
  end

  test "that 429 error returns an :error atom" do
    FakeData.response_status_code(429)
    |> assert_error
  end

  test "that 501 error returns an :error atom" do
    FakeData.response_status_code(501)
    |> assert_error
  end

  test "that an undocumneted error returns an :error atom" do
    FakeData.response_status_code(502)
    |> assert_error
  end
end
