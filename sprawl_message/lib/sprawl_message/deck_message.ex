defmodule SprawlMessage.DeckMessage do
  @moduledoc """
  # SprawlDeck message
  """



  defmacro candidate,
    do: :candidate


  @doc "Build a message to reply for :ask_candidate message for reserver-proxy."

  defmacro candidate(pid, number),
    do: quote do: {:candidate, unquote(pid), unquote(number)}





end
