# SprawlDeck
... and SprawlRoulette are companion projects, to serve reverse proxy.

As the following ASCII block-drawing has show:
```
                                        ┌──────────────┐
                                        │ Node with    │
┌──────────────────┐        ╭───────────┤ :sprawl_deck │
│ Node with        │────────╯           └──────────────┘
│ :sprawl_roulette │────────╮           ┌──────────────┐
└──────────────────┘        ╰───────────┤ Node with    │
                                        │ :sprawl_deck │
                                        └──────────────┘
```

By means of those name, SprawlDeck plays as a service deck, while
SprawlRoulette picks one from many service decks every time when it takes a
request.

SprawlDeck will give a random number to SprawlRoulette when it's ready to
serve. Then SprawlRoulette may pass a request object to that SprawlDeck for
processing the request.

## Installation

The package can be installed by adding `sprawl_deck` to your list of
dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sprawl_deck, ">= 1.0.0", path: "../sprawl_deck"}
  ]
end
```

