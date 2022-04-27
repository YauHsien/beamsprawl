defmodule Example do
  @moduledoc """
  Documentation for `Example`.
  """

  defmacro pub_sub_name(module),
    do: quote do: :"#{My.PubSub} for #{unquote(module)}"

  def app,
    do: :example
end
