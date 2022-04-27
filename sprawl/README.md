# Sprawl
The BEAM Sprawl is an tiny application to glue ERTS nodes, to form a network.

As quote from W. Gibson's "Neuromancer," chapter 3,

"Home.
Home was BAMA, the Sprawl, the Boston-Atlanta Met ropolitan Axis.
Program a map to display frequency of data exchange, every thousand megabytes a single pixel on a very large screen. Manhattan and Atlanta burn solid white. Then they start to pulse, the rate of traffic threatening to overload your simulation. Your map is about to go nova. Cool it down. Up your scale. Each pixel a million megabytes. At a hundred million mega bytes per second, you begin to make out certain blocks in midtown Manhattan, outlines of hundred-year-old industrial parks ringing the old core of Atlanta..."

「『市埠』，我們的老家」。

## Installation

The package can be installed by adding `sprawl` to your list of dependencies in `mix.exs`, as specified in [Mix.Tasks.Deps](https://hexdocs.pm/mix/1.12.3/Mix.Tasks.Deps.html):

```elixir
def deps do
  [
    {:sprawl, ">= 1.0.0", path: "../sprawl"}
  ]
end
```

## Usage

Then in application section (see `mix help compile.app`), add `:sprawl` to extra applications list:

```elixir
def application do
    [
      extra_applications: [:logger, :sprawl]
    ]
end
```

Sprawl would like to read `:seed_node` from a configuration file. You may want to put a line in `config/Config.exs` to tell your application which the seed node is:

```elixir
config :sprawl,
  seed_node: :"seed_node@example.com"
```

Then, first run the seed node named as "seed_node@example.com"

```sh
# Suppose the machine host name is "example.com"
$ iex --sname seed_node -S
```

Run your application in distributed way, like that:

```sh
# Suppose your application is a mix project,
$ iex --sname my_node -S mix
```

You can check nodes infomation by using a command as it runs in a command shell.

```elixir
iex(my_node@example.com)1> `:net_kernel.nodes_info()`
{:ok,
 [
   "seed_node@example.com": [
     owner: #PID<0.114.0>,
     state: :up,
     address: {:net_address, {{127, 0, 0, 1}, 45846}, 'example.com',
      :tcp, :inet},
     type: :normal,
     in: 18,
     out: 19
   ]
 ]}
```

## Example

See [this](https://github.com/YauHsien/tree/main/example).
