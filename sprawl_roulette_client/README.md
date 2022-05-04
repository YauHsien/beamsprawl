# SprawlRouletteClient
... This is a client for SprawlRoulette.

## Installation

The package can be installed by adding `sprawl_roulette_client` to your list
of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sprawl_roulette_client, ">= 1.0.0", path: "../sprawl_roulette_client"}
  ]
end
```

## Usage

In configuration, you need know a pub-sub object in the node and the flow-in
topic.

```elixir
config :sprawl_roulette_client, :sprawl_roulette,
  pub_sub: SprawlRoulette.PubSub,
  topic_for_flow_in: "SprawlRoulette Flow-in topic"
```

Then you can feel free to pass some request object by
`SprawlRouletteClient.request/1`, `SprawlRouletteClient.request/2`.

```elixir
......
# After getting some request object `req`
case SprawlRouletteClient.request(req) do
  {:ok, result} ->
    result
  :timeout ->
    {:error, :timeout}
end
```

Or you can pass it with `return_pid` by `SprawlRouletteClient.request/2`.

```elixir
return_pid = self()
# Somehow you also got the pid from the requesting party,
SprawlRouletteClient.request(return_pid, req)
# And wait results by your sake.
receive do
  message ->
    #TODO: build some result
    ...
after
  50000 ->
    {:error, :timeout}
end
```
