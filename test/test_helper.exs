Code.require_file "support/fake_data.ex", __DIR__
Code.require_file "support/in_memory_http_client.ex", __DIR__
DecipherAPITest.Support.InMemoryHTTPClient.start()
ExUnit.start()
