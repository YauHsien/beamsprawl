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
      extra_applications: [:logger, :sprawl]
    ]
  end

  defp deps do
    [
      {:sprawl, ">= 1.0.0", path: "../sprawl"}
    ]
  end
end
