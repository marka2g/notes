defmodule Chunker.Router do
  use Plug.Router
  require Logger

  # pattern matching module
  plug(Plug.Logger)
  # NOTE: The line below is only necessary if you care about parsing JSON
  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
  plug(:match)
  plug(:dispatch)

  def init(options) do
    Logger.info("Chunker Started!")
    options
  end

  def start_link do
    port = Application.fetch_env!(:chunker, :port)
    {:ok, _} = Plug.Adapters.Cowboy.http(__MODULE__, [], port: port)
  end

  get "/hey" do
    send_resp(conn, 200, "Hey Chunk!")
  end

  post "/hey" do
    {status, body} =
      case conn.body_params do
        %{"name" => name} -> {200, say_hey(name)}
        _ -> {422, missing_name()}
      end

    send_resp(conn, status, body)
  end

  # order is important.  if this was above, the get, the get would never run because it would match on everything
  # match(_, do: send_resp(conn, 404, "404 Not Found Error!"))

  defp say_hey(name) do
    Poison.encode!(%{response: "Hey, #{name}"})
  end

  defp missing_name do
    Poison.encode!(%{error: "Expected a \"name\" key"})
  end
end
