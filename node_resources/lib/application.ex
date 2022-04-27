defmodule NodeResources.Application do
  @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do

    Supervisor.start_link(
      Application.fetch_env!(:node_resources, :supervisor)[:child_spec_list]
      |> Code.eval_quoted
      |> elem(0),
      strategy: :one_for_one,
      name: NodeResources.Supervisor
    )
  end
end
