# Chunker - A Web Service Aggregator

---
## Important Links
[ended up following this](https://samueldavies.net/2017/04/29/how-to-build-a-lightweight-webhook-endpoint-in-elixir-with-plug-not-phoenix/)
[github source - hello_webhook](https://github.com/samphilipd/hello_webhook)
[Plug Docs - Cowboy2](https://hexdocs.pm/plug/Plug.Adapters.Cowboy2.html#child_spec/1)
[Plug.Conn chunk](https://hexdocs.pm/plug/Plug.Conn.html#chunk/2)
[Plug.Conn send_chunked](https://hexdocs.pm/plug/Plug.Conn.html#send_chunked/2)
[Plug.Conn.Adapter <adapter> chunk/2](https://hexdocs.pm/plug/Plug.Conn.Adapter.html#c:chunk/2)
[Plug.Conn.Adapter <adapter> send_chunked/3](https://hexdocs.pm/plug/Plug.Conn.Adapter.html#c:send_chunked/3)


---
## Steps

### Create a mix project

`$ mix new chunker && cd chunker`

### Add Plug and Cowboy to Deps

> Like rake Plug takes in a a `data structure - conn` and then transforms the data structure & then returns the data structure. In this case, we're taking in a connection which represents an http request. All the Plugs inside a Plug receives and returns connections - this makes them extremely composeable. iow, we can take multiple Plugs and put them together.

```elixir
def application do
  # [
  #   extra_applications: [:logger]
  # ]
  # add :plug, :cowboy
  [
    extra_applications: [:logger, :plug, :cowboy]
  ]
end

defp deps do
  [
    {:cowboy, "~> 1.1"},
    {:plug, "~> 1.6"},
    {:poison, "~> 3.0"}
  ]
end
```

### Create `lib/chunker/router.ex`

### Build our Application file
[Plug Docs - Cowboy2](https://hexdocs.pm/plug/Plug.Adapters.Cowboy2.html#child_spec/1)

Add start function to `lib/chunker.ex`

```elixir
defmodule Chunker do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Chunker.Router, [])
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: HexVersionSupervisor)
  end
end
```


### Get deps
> $`mix do deps.get, compile`

### Now, run the app
> $`iex -S mix`

### Go to localhost in a browser
> $`localhost:4040/hey`

### or, use `curl` as the client

> $ `curl http://localhost:4040/hey`

bad `POST` req
> $ `curl -H "Content-Type: application/json" -X POST -d '{}' http://localhost:4040/hey_there`

{"error":"Expected a \"name\" key"}

do it right

> $ `curl -H "Content-Type: application/json" -X POST -d '{"name": "Chunk"}' http://localhost:4040/hey`

{"response":"Hey, Chunk!"}

#### curl x-ndjson example
[elastic search example](https://www.elastic.co/guide/en/kibana/current/tutorial-load-dataset.html)

> $ `curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/bank/account/_bulk?pretty' --data-binary @accounts.json`

----

## ExUnit Tests

first, we need to add some config so that the test server runs on a different port than the server.

`chunker/config/config.exs`

```elixir
# uncomment this line
import_config "#{Mix.env}.exs"
```

`chunker/config/dev.exs`

```elixir
use Mix.Config
config :chunker, port: 4040
```

`chunker/config/test.exs`

```elixir
use Mix.Config
config :chunker, port: 4041
```

`chunker/config/prod.exs`

```elixir
use Mix.Config
# NOTE: Use $PORT environment variable if specified, otherwise fallback to port 80
port =
  case System.get_env("PORT") do
    port when is_binary(port) -> String.to_integer(port)
    nil -> 80
  end

config :chunker, port: port
```

also `IMPORTANT`.  we have to tell the `Router start_link/0` that it should use the specified port

```elixir
#...
def start_link do
  port = Application.fetch_env!(:chunker, :port)
  {:ok, _} = Plug.Adapters.Cowboy.http(__MODULE__, [], port: port)
end
```

### Add a basic test

### Run an ExUnit test

single test - not what we want to do
> $ `mix test test/chunker_test.exs`

do this
> $ `mix test`

----
#### random thoughts
i like phx Contexts -> solves so many 'sea of unrelated objects' issues

