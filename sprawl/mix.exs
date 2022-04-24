defmodule Sprawl.MixProject do
  use Mix.Project

  def project do
    [
      app: :sprawl,
      version: "1.0.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Sprawl.Application, []}
    ]
  end
end
