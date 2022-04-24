defmodule Sprawl.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do

    if node() !== :nonode@nohost,
      do: Application.fetch_env!(:sprawl, :seed_node) |>
        :net_kernel.connect_node()

    children = [
    ]
    opts = [strategy: :one_for_one, name: Sprawl.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
