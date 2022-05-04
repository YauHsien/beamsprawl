defmodule SprawlDeck.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Phoenix.PubSub, name: Application.fetch_env!(:sprawl_deck, :sprawl_roulette)[:pub_sub]},
      SprawlDeck.Worker
    ]

    opts = [strategy: :one_for_one, name: SprawlDeck.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
