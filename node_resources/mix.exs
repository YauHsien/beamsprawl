defmodule NodeResources.MixProject do
  use Mix.Project

  def project do
    [
      app: :node_resources,
      version: "1.0.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {NodeResources.Application, []}
    ]
  end

  defp deps do
    [
    ]
  end
end
