defmodule SprawlMessage.RouletteMessage do
  @moduledoc """
  # SprawlRoulette message
  """



  @doc "Build messages to ask for reverse-proxy candidates."

  defmacro ask_candidate(),
    do: quote do: :ask_candidate



  @doc "Build message either as waiting from flow-in channel, or to forward request object."

  defmacro request(return_pid, req),
    do: quote do: {:request, unquote(req), unquote(return_pid)}




end
