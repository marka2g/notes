defmodule ChunkerTest do
  use ExUnit.Case, async: true
  use Plug.Test
  doctest Chunker

  @options Chunker.Router.init([])

  test "GET /hey" do
    # create a test connection
    conn = conn(:get, "/hey")

    # invoke the plug
    conn = Chunker.Router.call(conn, @options)

    # assert response status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hey Chunk!"
  end

  test "POST /hey with invalid payload" do
    body = Poison.encode!(%{nameski: "FrankieBaggaDonuts"})

    conn =
      conn(:post, "/hey", body)
      |> put_req_header("content-type", "application/json")

    conn = Chunker.Router.call(conn, @options)
    assert conn.state == :sent
    assert conn.status == 422
    assert Poison.decode!(conn.resp_body) == %{"error" => "Expected a \"name\" key"}
  end

  test "POST /hey with valid payload" do
    body = Poison.encode!(%{name: "Chunk"})

    conn =
      conn(:post, "/hey", body)
      |> put_req_header("content-type", "application/json")

    conn = Chunker.Router.call(conn, @options)
    assert conn.state == :sent
    assert conn.status == 200
    assert Poison.decode!(conn.resp_body) == %{"response" => "Hey, Chunk"}
  end
end
