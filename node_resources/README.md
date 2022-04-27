# NodeResources
To manage node resources such as Phoenix.PubSub servers.

## Installation

The package can be installed by adding `node_resources` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:node_resources, ">= 1.0.0"}
  ]
end
```

## Usage

Then in application section (see `mix help compile.app`), add `:sprawl` to extra applications list:

```elixir
def application do
    [
      extra_applications: [:logger, :node_resources]
    ]
end
```

To build two Phoenix.PubSub servers for the node, put a line in `config/Config.exs` to tell your application which the seed node is: notice that terms `:supervisor` and `:child_spec_list` are specific by the application `:node_resources`,

```elixir
config :node_resources, :supervisor,
  child_spec_list: quote do: [
    Supervisor.child_spec({Phoenix.PubSub, name: PubSub.Example.I}, id: :pub_0),
    Supervisor.child_spec({Phoenix.PubSub, name: PubSub.Example.II}, id: :pub_1)
  ]
```

Then run the application:

```sh
$ iex -s mix
```

## Example

See [this](https://github.com/YauHsien/tree/main/example).
