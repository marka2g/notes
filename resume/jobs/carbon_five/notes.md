# Web Service Aggregator

[plug and cowboy](https://www.youtube.com/watch?v=F4oAZx_ao4s)

[This is the crux - elixir streaming - a love story - File.stream v File.stream](https://9elements.com/io/streaming-downloads-in-elixir--a-protocol-love-story/)

> File.read! |> Enum

First we read in the entire file, then we transform the contents in several steps until we have the one number we need. In each step, we consume the data from the previous step wholesale and produce the input for the next step. This is rather inefficient, imagine the input file being really large: we would consume about twice the size of the file for memory. We could merge several steps into one, such that there is only one Enum.map step instead of three, but that would not really solve the problem.

```elixir
File.read!("per_hour.csv")
  |> String.split("\n")
  # map() Returns a list where each item is the result of invoking fun on each corresponding item of enumerable
  |> Enum.map(&String.split(&1, ","))
  # Drops the amount of items from the enumerable.
  |> Enum.drop(1)
  |> Enum.map(&Enum.at(&1, 2))
  |> Enum.map(&String.to_float/1)
  |> Enum.reduce(0, &Kernel.+/2)
```
v.

> File.stream! |> Stream
Instead, we want all row transformations to occur in sequence for each individual row, before continuing with the next row. This is what Stream allows us to do.
The Stream struct accomplishes this by simply recording the needed steps, until finally the data iteration has to happen, which is whenever we work with any of the functions from the Enum module on it. This is why we say the functions in Stream work `lazily` and those in Enum `eagerly`. As it turns out, the `File` module and `CSV` hex package already handle the first two steps for us. Our improved code looks like this:

```elixir
File.stream!("per_hour.csv")
  |> CSV.decode!
  |> Stream.drop(1)
  |> Stream.map(&Enum.at(&1, 2))
  |> Stream.map(&String.to_float/1)
  |> Enum.reduce(0, &Kernel.+/2)
```

We are creating a Stream struct in the first row, transforming it into new ones, and eventually, by passing the final stream to Enum.reduce/3, the entire operation (opening and closing the file and transforming the content) takes place.

> Note that several of the steps look no different than before, except that we are using a function from the Stream module instead of Enum. These functions recognize when their input is a Stream struct and simply add to it.

`Enum` and Elixir `Protocols` - `Enum.drop(1)` v `Stream.drop(1)`
> Protocols provide “data polymorphism”, dispatching to different function implementations depending on a data type. The dispatch happens on the first argument of a protocol’s function and works as if implicitly pattern matching on the argument’s data structure. That’s essentially all there is to how protocols work.

In the case of the functions in the Enum module, they all eventually call a function in the Enumerable protocol. To make a type enumerable, all you need to do is implement a function for the basic reducing algorithm. (For completeness, there are three functions to implement, two of which provide optional optimizations.) Think of the `Enum` functions as a` grab-bag of convenient iterations, that all boil down to function calls in the Enumerable protocol`.

So when our stream hits Enum.reduce/3 in the example above, an algorithm in the Stream module is used to produce the values of the stream, and this algorithm is implemented such that this iteration works lazily.

Protocols allow us to do two things:
1. conceptualize dealing with data in a certain way by separating the data type from an implementation consuming it

2. extending such a concept with an implementation for a new data type.

`Plug.Conn`

[send_chunked](https://hexdocs.pm/plug/Plug.Conn.html#send_chunked/2)

[chunk](https://hexdocs.pm/plug/Plug.Conn.html#chunk/2)


**The Beef - Plug and `chunked` on the web**

How to on the web - use enumeration...

Elixir’s Plug models it like this:

```elixir
conn
  |> send_chunked(200)
  |> chunk("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt")
  |> chunk("ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation")
  |> chunk("ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit")
  |> chunk("in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat")
  |> chunk("non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
```
Since we do not know the number of chunks to come, we need to wrap the chunk/2 calls in some kind of iteration. This would work:

```elixir
chunks_of_data
  |> Enum.reduce(conn, fn a_chunk, conn -> chunk(conn, a_chunk) end)
```

We are shoveling chunks of data from a collection over to the client, one by one, thereby transforming the conn. Again, this should sound like a familiar concept. Doesn’t this code work similarly?

#### `Enum.into/2`

```elixir
iex> [1, 2, 3, 4] |> Enum.into(MapSet.new)


# also
iex> MapSet.new([1, 2, 3, 4])
iex> MapSet.to_list(ms)
```

Here, we iterate over a list to populate a `MapSet` with the list items, one by one, transforming the set with each item (we have to, since there is no in-place update of data in Elixir).

How does this work? Well, `Enum.into/2` is a bit special since it uses another protocol in addition to `Enumerable`, namely, Collectable. Any data type can implement this protocol to define how a "pushing data item by item into it while transforming the data" process looks like. `MapSet` does so, which is why we can pass it in.

Since `Plug.Conn` implements Collectable as well, so our reduce version above can simply become

```elixir
# from
chunks_of_data
  |> Enum.reduce(conn, fn a_chunk, conn -> chunk(conn, a_chunk) end)

# to using Enum.into()
chunks_of_data
  |> Enum.into(conn)

```

#### Putting It All Together
In our initial KPI report, which we want to stream as a download. Let’s assume the data stream is produced by a function kpi_data_stream/0, and for consumption as a download, we need to transform each data item through present_kpi_row/1 (so we have access to the low level stream for testing and debugging). This should do it:

```elixir
kpi_data_stream()
  |> Stream.map(&present_kpi_row/1)
  |> (fn stream -> Stream.concat(table_head, stream) end).()
  |> CSV.encode
  |> Enum.into(
    conn
      |> put_resp_content_type("application/csv")
      |> put_resp_header("content-disposition", "attachment; filename=downlaod.csv")
      |> send_chunked(200)
  )
```

We are prepending the table head row by using Stream.concat/2, since there is no Stream.prepend, hence the clunky anonymous function in the pipeline. Still, this code gives us a calm, concise and manageable description and implementation of the problem, made possible by several protocols (taking Ecto and CSV internals into account, there are more protocols at work here that serve conversion needs. Just be aware of that when you want to pass your own data types through other’s libraries…)

#### Warning tho...

Even though there would be a way for browsers to detect a prematurely aborted stream, expect users to get a truncated downloaded without noticing. This is important when truncation is hard to spot (as in our example with a CSV), and it is possible to draw wrong conclusions from a truncated file.

To mitigate this problem, use the following workaround:

```elixir
head = [["ATTENTION", "File may be truncated, check for END OF FILE line at the bottom!"], []]
tail = [["END OF FILE (download is complete)"]]

stream
  |> (& Stream.concat([head, &1, tail])).()
  |> CSV.encode
```

##### Streaming from Ecto

As mentioned at the beginning, our initial problem was that Ecto queries used for generating reports timed out. This demonstrates how a streaming download looks like when pulling data from the database. All examples so far look essentially like this:

```elixir
produce_stream()
  |> transform_stream
  | Enum.into(
    conn
      |> send_chunked(200)
  )
```

Ecto provides the `Repo.stream/2` callback (this means that your app repo has a `MyApp.Repo.stream/2` function) which produces a stream for a query. Unfortunately, calling `stream/2` is only allowed inside a transaction, which breaks the symmetry with all other use cases:

```elixir
Repo.transaction(fn ->
  build_query()
  |> Repo.stream
  |> transform_stream
  |> Enum.into(
    conn
      |> send_chunked(200)
  )
end)
  |> (fn {:ok, conn} -> conn end).()
```

In addition to wrapping the execution, transaction also returns {:ok, conn} (if nothing went wrong), so we need to get the conn out in order to properly return a conn from a Phoenix controller action.

To the author, this is a serious limitation. here's the why explanation:

> The code snippets above operate at different levels of abstraction: the low-level query and formation of the initial stream, the high-level presentation as a stream of report data, the low level encoding as a CSV and the low level HTTP handling are all mixed up together. That’s okay for such a blog post, because it makes the examples simpler, and I can focus on certain aspects. In practice, I also sometimes tolerate this when the amount of code is very small, I expect tidying up later to be straight-forward, and I am not yet sure what the right abstraction and place for the code is.
But in most cases, I want to separate these layers. To be able to test-drive an implementation, to be able to have a simpler and faster testing experience, to obtain a better overview of what my application actually does (and not smear my core application logic all over the components my framework dictates me to use), and to be able to refactor mercilessly later, when needed. And for that I need composability. I really like that Phoenix, the web framework, pushes into the direction of separating application logic from web layer support. By breaking composability, Ecto streaming makes this hard. I have an ugly workaround for this: The low-level stream, wrapped in a transaction, is consumed in a separate process, and the parent process builds a new stream from data chunks transferred from the child via message passing. That works, but it’s really ugly, low-level and certainly inefficient.



----

[see gist: Interview: Web Service Aggregator](https://gist.github.com/laser/ab370b144e320a9e8b40920f4b34ac73)

[bare bones json elixir](https://github.com/Decisiv/json_api_client)

[Chunker - giphy](https://media.giphy.com/media/Z5eFxoKjf218c/giphy.gif)

[video - Stream](https://www.youtube.com/watch?v=yJ5TPOKveNo)

-----

[elixir - transfer encoding chunked](https://github.com/faithandbrave/elixir-phoenix-chunked-response-example)

[Plug, Plug.Conn](https://hexdocs.pm/plug/readme.html)

[awesome list of self hosted apis](https://github.com/Kickball/awesome-selfhosted)

[mock api](https://www.mockapi.io/projects/5b73aa42414e970014304ba8)
  - [mock api users example - json](https://5b73aa42414e970014304ba7.mockapi.io/api/v1/users)

-----

## blogs to read
[chunked transfer encoding](https://en.wikipedia.org/wiki/Chunked_transfer_encoding)

[elixir conf 2017 - Streaming Video with elixir](https://www.youtube.com/watch?v=eNe5dmRP9Cc&t=920s)
  - [john wahba - vdemo](https://github.com/johnwahba/vdemo2017)

[bare bones web crawler with elixir](http://www.petecorey.com/blog/2017/10/09/learning-to-crawl-building-a-bare-bones-web-crawler-with-elixir/)

[medium - phx endpoint p1](https://medium.com/@lasseebert/test-driving-a-phoenix-endpoint-part-i-b53e300c1a0a)

[medium - phx endpoint p2](https://medium.com/@lasseebert/mocks-in-elixir-7204f8cc9d0f)

[Pattern: API Gateway / Backend for Front-End](http://microservices.io/patterns/apigateway.html)

[ruby - transfer encoding chunked](https://marianposaceanu.com/articles/chunked-transfer-encoding-in-rails-streaming)

[transfer encoding chunked](https://dzone.com/articles/mocking-rest-api-with-wiremock-using-recording-mod)

[file uploads - not chunked multipart](https://philsturgeon.uk/api/2016/01/04/http-rest-api-file-uploads/)


[old elixir http streaming example](http://miguelcamba.com/blog/2013/04/29/tutorial-build-a-web-app-using-elixir-and-dynamo-with-streaming-and-concurrency/)


[rails 3 explanation of streaming - old but simple & relevant](https://weblog.rubyonrails.org/2011/4/18/why-http-streaming/)

An ordinary http response need `Content-Length header`
timeline looks like these serialized steps:

`HTTP request -> dynamic content generation -> HTTP response`

HTTP has an alternative called `chunked transfer encoding` or `streaming`. Streamed responses have no Content-Length header.  Instead, they a `Transfer-Encoding header` with a value of `chunked`, and a body consisting of a series of chunks you write to a socket preceded by their individual sizes.

> from wikipedia -> Point is, you are able to flush chunks to the socket as soon as you have them, no need to wait for the whole thing to be generated.

```
HTTP/1.1 200 OK
Content-Type: text/plain
Transfer-Encoding: chunked

25
This is the data in the first chunk

1C
and this is the second one

3
con
8
sequence
0
```


> Ground up mix proj

`$ mix new chunker`

add deps to mix.exs

```elixir
defp deps do
  [
    {:csv, "~> 2.1.1"}
  ]
end
```


`$ mix deps.get`

fire up iex:

`$ iex -S mix`
