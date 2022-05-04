defmodule SprawlRoulette.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Registry, keys: :duplicate, name: SprawlRoulette.Registry},
      {Phoenix.PubSub, name: Application.fetch_env!(:sprawl_roulette, :pub_sub)},
      SprawlRoulette.Worker
    ]

    opts = [strategy: :one_for_one, name: SprawlRoulette.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
