defmodule SprawlRouletteClient do
  @moduledoc """
  Documentation for `SprawlRouletteClient`.
  """
  require SprawlMessage.RouletteMessage
  alias   SprawlMessage.RouletteMessage

  @pub_sub Application.fetch_env!(:sprawl_roulette_client, :sprawl_roulette)[:pub_sub]
  @topic_for_flow_in Application.fetch_env!(:sprawl_roulette_client, :sprawl_roulette)[:topic_for_flow_in]

  @spec request(pid(), map()) :: {:ok, term()} | :timeout
  def request(return_pid, req) do
    Phoenix.PubSub.broadcast!(@pub_sub, @topic_for_flow_in, RouletteMessage.request(return_pid, req))
  end

  @spec request(map(), integer()) :: {:ok, term()} | :timeout
  def request(req, timeout \\ 50000) do
    return_pid = "#{inspect self()}"
    Phoenix.PubSub.subscribe(@pub_sub, return_pid)
    Phoenix.PubSub.broadcast!(@pub_sub, @topic_for_flow_in, RouletteMessage.request(return_pid, req))
    receive do
	    {:message_type, value} ->
		    # code
    after
      timeout ->
        :timeout
    end
  end
end
