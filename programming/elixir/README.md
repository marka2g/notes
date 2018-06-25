# Elixir

## [Elixircasts](https://elixircasts.io/)

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
> If all is good, you should see:
>> `The database for Teacher.Repo has been created`

> start the server with:
```sh
$ mix phx.server
```
*by default, cowboy server opens on `port 4000` [localhost:4000](http://localhost:4000)*

> In situations where you want to generate a full HTML resource, phoenix provides a task to set everything up for you.
```sh
$ mix phoenix.gen.html Post posts title:string body:text
```

Add the resource to `web/router.ex`:
```elixir
scope “/“, Teacher do
  pipe_through :browser

  get “/“, PageController, :index
  resources "/posts", PostController
end
```

> if all looks good, migrate the db:
```sh
$ mix ecto.migrate
```

> see the routes with this handy command:
```sh
$ mix phx.routes
```
*or grep thru them*
```sh
$ mix phx.routes | grep posts
```
#### *Docs & Links*
1. [Phoenix Hexdocs](https://hexdocs.pm/phoenix/up_and_running.html)
2. [Episode Source Code](https://github.com/elixircastsio/001-getting-started-with-phoenix)


### [Ecto Associations 02 :family:](https://elixircasts.io/adding-comments-with-ecto-associations)
#### *Steps & Commands*
>  Add comments to posts.  A Post `has_many` comments

>  Phoenix task to generate the model.
>> singular module name ‘Comment’, and the plural version ‘comments’ for the database table. Then a list of attributes for our comments. In this case we’ll want them to have a body that’s a text. And since comments will belong to a post, we’ll create a ‘post_id’ and reference posts. This will help setup our association.
```sh
$ mix phoenix.gen.model Comment comments body:text post_id:references:posts
```

> Before we migrate our database, let’s look at the comment model it generated. Since we referenced ‘posts’, the `belongs_to :post` association was already setup for us:
```elixir
defmodule Teacher.Comment do
  use Teacher.Web, :model

  schema "comments" do
    field :body, :string
    # got this from generator
    belongs_to :post, Teacher.Post, foreign_key: :post_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body])
    |> validate_required([:body])
  end
end
```
* but we need to add the `has_many :comments` association to the schema of `Post`.

> add to `web/models/post.ex`
```elixir
defmodule Teacher.Post do  
  use Teacher.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string
    has_many :comments, Teacher.Comment
  end
  ...
end
```

#### *Docs & Links*
1. [Episode Source Code](https://github.com/elixircastsio/002-adding-comments-with-ecto-has-many-and-belongs-to)


## [Pragmatic Studio](https://online.pragmaticstudio.com/courses/elixir/)
