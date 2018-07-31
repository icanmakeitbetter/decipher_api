Code.require_file "support/raw_response.ex", __DIR__
Code.require_file "support/fake_data.ex", __DIR__
DecipherAPITest.Support.InMemoryHTTPClient.start()
ExUnit.start()
