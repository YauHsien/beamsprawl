# SprawlRoulette
... and SprawlDeck are companion projects, to serve reverse proxy.

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

SprawlRoulette performs choice by asking each SprawlDeck to give a random
number and picking the largest one. Then SprawlRoulette will pass the request
object to the chosen SprawlDeck and let the requesting party wait for its
response.


## Installation

The package can be installed by adding `sprawl_roulette` to your list of
dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sprawl_roulette, ">= 1.0.0", path: "../sprawl_roulette"}
  ]
end
```

