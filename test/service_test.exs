defmodule DecipherAPITest.ServiceTest do
  alias DecipherAPI.Service
  alias DecipherAPITest.Support.FakeData

  use ExUnit.Case, async: true

  test "that 400 error returns appropiate value" do
    response = FakeData.response_status_code(400)

    assert Service.parse_response(response) ==
             {:error,
              "#{response.status_code}: other invalid parameter not covered above, e.g. survey cannot be loaded due to an error"}
  end

  test "that 401 error returns appropiate value" do
    response = FakeData.response_status_code(401)

    assert Service.parse_response(response) ==
             {:error,
              "#{response.status_code}: invalid authentication; your API key is invalid, expired or not valid from this IP or action"}
  end

  test "that 402 error returns appropiate value" do
    response = FakeData.response_status_code(402)

    assert Service.parse_response(response) ==
             {:error,
              "#{response.status_code}: payment required: you have exceeded your monthly API calls"}
  end

  test "that 403 error returns appropiate value" do
    response = FakeData.response_status_code(403)

    assert Service.parse_response(response) ==
             {:error,
              "#{response.status_code}: invalid authorization: your API key is valid but you are not allowed access to this survey"}
  end

  test "that 404 error returns appropiate value" do
    response = FakeData.response_status_code(404)

    assert Service.parse_response(response) ==
             {:error,
              "#{response.status_code}: not found: you asked for a survey or other resource that does not exist. Or asked to reset a datafeed that was already reset"}
  end

  test "that 405 error returns appropiate value" do
    response = FakeData.response_status_code(405)

    assert Service.parse_response(response) ==
             {:error,
              "#{response.status_code}: method not allowed: you tried to e.g. DELETE something that does not support deletion"}
  end

  test "that 429 error returns appropiate value" do
    response = FakeData.response_status_code(429)

    assert Service.parse_response(response) ==
             {:error, "#{response.status_code}: too many concurrent requests"}
  end

  test "that 501 error returns appropiate value" do
    response = FakeData.response_status_code(501)

    assert Service.parse_response(response) ==
             {:error,
              "#{response.status_code}: Method not implemented in API. Resources does not implement this method. Are you using GET/POST/PUT/DELETE?"}
  end

  test "that an undocumneted error returns appropiate value" do
    response = FakeData.response_status_code(502)

    assert Service.parse_response(response) ==
             {:error, "API returned an undocumented HTTP status code of: #{response.status_code}"}
  end
end
