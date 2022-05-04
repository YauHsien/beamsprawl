defmodule SprawlMessage do
  @moduledoc """
  Documentation for `SprawlMessage`.
  """

  @type id() :: integer() | String.t()
  @type t() :: term()
  @type topic() :: String.t()
  @type return_addr() :: String.t()

  @doc "Topic to use in a pub-sub channel."

  @spec topic(t()) :: topic()
  def topic(name),
    do: "topic #{inspect name}"


  @doc "Topic as return address to use in a pub-sub channel."

  @spec return(topic()) :: return_addr()
  def return(topic),
    do: "return " <> topic


  @doc "Topic as return address dedicated to an identity to use in a pub-sub channel."

  @spec return(topic(), id()) :: return_addr()
  def return(topic, id),
    do: "return #{topic} to #{inspect id}"



  def return_addr(resource),
    do: NaiveDateTime.utc_now() |>
      NaiveDateTime.to_gregorian_seconds() |>
      then(&("#{resource}:#{inspect &1}"))


end
