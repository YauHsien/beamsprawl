defmodule SprawlRoulette.Worker do
  use GenServer
  require SprawlMessage.RouletteMessage
  alias   SprawlMessage.RouletteMessage
  require SprawlMessage.DeckMessage
  alias   SprawlMessage.DeckMessage

  def start_link(args), do: GenServer.start_link(__MODULE__, args)

  @pub_sub Application.fetch_env!(:sprawl_roulette, :pub_sub)
  @registry SprawlRoulette.Registry
  @topic_for_flow_in Application.fetch_env!(:sprawl_roulette, :topic_for_flow_in)
  @topic_for_reverse_proxy Application.fetch_env!(:sprawl_roulette, :topic_for_reverse_proxy)


  @impl true

  def init(_args) do

    [
      @topic_for_flow_in,
      @topic_for_reverse_proxy
    ]
    |> Enum.map(&( Phoenix.PubSub.subscribe(@pub_sub, &1) ))

    {:ok, %{}}
  end




  @impl true

  def handle_info(RouletteMessage.request(source_pid, req), state) do
    choice_and_send(req, source_pid)
    {:noreply, state}
  end

  def handle_info(DeckMessage.candidate(pid, number), state) do
    Registry.register(@registry, DeckMessage.candidate(), DeckMessage.candidate(pid, number))
    {:noreply, state}
  end

  def handle_info(_msg, state),
    do: {:noreply, state}




  defp choice_and_send(req, source_pid) do

    Phoenix.PubSub.broadcast!(@pub_sub, @topic_for_reverse_proxy, RouletteMessage.ask_candidate())
    :timer.sleep(150)

    chosen_one =
      Registry.lookup(@registry, DeckMessage.candidate())
      |> Enum.max(fn (DeckMessage.candidate(_pid, n), DeckMessage.candidate(_pid2, n2)) -> n > n2 end)
      |> then(&( case &1 do DeckMessage.candidate(pid, _) -> pid end ))

    chosen_one
    |> send(RouletteMessage.request(source_pid, req))
  end




end
