defmodule SprawlDeck.MixProject do
  use Mix.Project

  def project do
    [
      app: :sprawl_deck,
      version: "1.0.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SprawlDeck.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_pubsub, ">= 2.1.1"},
      {:sprawl_message, ">= 1.0.0", path: "../sprawl_message"}
    ]
  end
end
