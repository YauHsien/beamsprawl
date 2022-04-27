defmodule Example.MixProject do
  use Mix.Project

  def project do
    [
      app: :example,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [
        :logger,
        :sprawl,
        :phoenix_pubsub,
        :node_resources
      ]
    ]
  end

  defp deps do
    [
      {:node_resources, ">= 1.0.0", app: false, path: "../node_resources"},
      {:phoenix_pubsub, ">= 2.1.1"},
      {:sprawl, ">= 1.0.0", app: false, path: "../sprawl"}
    ]
  end
end
