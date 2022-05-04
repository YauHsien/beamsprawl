defmodule SprawlDeck.Worker do
  use GenServer
  require SprawlMessage.RouletteMessage
  alias   SprawlMessage.RouletteMessage
  require SprawlMessage.DeckMessage
  alias   SprawlMessage.DeckMessage

  @pub_sub Application.fetch_env!(:sprawl_deck, :sprawl_roulette)[:pub_sub]
  @topic_for_reverse_proxy Application.fetch_env!(:sprawl_deck, :sprawl_roulette)[:topic_for_reverse_proxy]
  @request_handler Application.fetch_env!(:sprawl_deck, :request_handler)


  def start_link(args), do: GenServer.start_link(__MODULE__, args)



  @impl true

  def init(_args) do

    Application.fetch_env!(:sprawl_deck, :sprawl_roulette)[:topic_for_reverse_proxy]
    |> then(&( Phoenix.PubSub.subscribe(Application.fetch_env!(:sprawl_deck, :sprawl_roulette)[:pub_sub], &1) ))

    {:ok, %{}}
  end


  @impl true

  def handle_call(req, _from, state) do
    {:reply, req, state}
  end


  @impl true

  def handle_info(msg, state)


  def handle_info(RouletteMessage.ask_candidate(), state) do

    number = NaiveDateTime.utc_now() |> NaiveDateTime.to_gregorian_seconds() |> elem(1)
    pid = self()
    Phoenix.PubSub.broadcast!(@pub_sub, @topic_for_reverse_proxy, DeckMessage.candidate(pid, number))

    {:noreply, state}
  end


  def handle_info(RouletteMessage.request(source_pid, req), state) do

    source_pid
    |> send(GenServer.call(@request_handler, req))

    {:noreply, state}
  end


  def handle_info(_msg, state),
    do: {:noreply, state}



end
