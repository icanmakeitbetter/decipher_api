use Mix.Config

Code.require_file "../test/support/in_memory_http_client.ex", __DIR__
config :decipher_api, service: DecipherAPITest.Support.InMemoryHTTPClient
