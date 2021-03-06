defmodule DecipherAPI.MixProject do
  use Mix.Project

  def project do
    [
      app: :decipher_api,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 1.0.0-rc.3", only: [:dev], runtime: false},
      {:excoveralls, "~> 0.9.1", only: :test},
      {:httpoison, "~> 1.1"},
      {:poison, "~> 2.2"},
      {:sweet_xml, "~> 0.6.5"}
    ]
  end
end
