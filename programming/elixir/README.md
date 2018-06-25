# Elixir

1. ## [Elixircasts](https://elixircasts.io/)
### [Getting Started with Phoenix 01 :rocket:](https://elixircasts.io/getting-started-with-phoenix)
#### *Steps & Commands*

>  generate a new phoenix project named ‘teacher’
```sh        
$ mix phx.new teacher
```
```sh        
$ Fetch and install dependencies? [Yn] Y
```
```sh        
$ cd teacher
```

> And open dev.exs `config/dev.exs` and update db settings
```elixir
config :teacher, Teacher.Repo,
  username: “postgres”,
  password: “postgres”,
  database: “teacher_dev”,
```
> create the database:
```sh
$ mix ecto.create
```
If all is good, you should see:
`The database for Teacher.Repo has been created`

> start the server with:
```sh
$ mix phx.server
```

> In situations where you want to generate a full HTML resource, phoenix provides a task to set everything up for you.
```sh
$ mix phoenix.gen.html Post posts title:string body:text
```

Add the resource to `web/router.ex`:
```elixir
resources "/posts", PostController
```

*by default, cowboy server opens on `port 4000` [localhost:4000](http://localhost:4000)*

2. ## [Pragmatic Studio](https://online.pragmaticstudio.com/courses/elixir/)

## Docs & Links
[Phoenix Hexdocs](https://hexdocs.pm/phoenix/up_and_running.html)
