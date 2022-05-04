defmodule SprawlRouletteClientTest do
  use ExUnit.Case
  doctest SprawlRouletteClient

  test "greets the world" do
    assert SprawlRouletteClient.hello() == :world
  end
end
