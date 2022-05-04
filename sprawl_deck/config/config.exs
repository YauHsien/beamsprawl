import Config

config :sprawl_deck, :sprawl_roulette,
  pub_sub: SprawlRoulette.PubSub,
  topic_for_reverse_proxy: "SprawlRoulette Rev-Proxy topic"

config :sprawl_deck,
  request_handler: SprawlRoulette.Worker
