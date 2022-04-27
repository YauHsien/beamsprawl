import Config

config :sprawl,
  seed_node: :"seed@yauhsien-Precision-5540"

config :node_resources, :supervisor,
  child_spec_list: quote do: [
    Supervisor.child_spec({Phoenix.PubSub, name: PubSub.Example.I}, id: :pub_0),
    Supervisor.child_spec({Phoenix.PubSub, name: PubSub.Example.II}, id: :pub_1)
  ]
