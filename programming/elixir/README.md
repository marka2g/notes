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
>> singular module name `Comment`, and the plural version `comments` for the database table. Then a list of attributes for our comments. In this case we’ll want them to have a body that’s a text. And since comments will belong to a post, we’ll create a `post_id` and reference posts. This will help setup our association.
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

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body])
    |> validate_required([:body])
  end
end
```
*but we need to add the `has_many :comments` association to the schema of `Post`.*

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
In active record, the `dependent: :destroy` addition will take care of deleting all the posts comments.  To do this in Ecto, we change a setting in the migration from `on_delete: :nothing` to `on_delete: :delete_all`.

> this:
```elixir
defmodule Teacher.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :text
      # by default, its set to :nothing
      add :post_id, references(:posts, on_delete: :nothing)
      timestamps()
    end

    create index(:comments, [:post_id])
  end
end
```
> gets changed to this:
```elixir
defmodule Teacher.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :text
      add :post_id, references(:posts, on_delete: :delete_all)

      timestamps()
    end

    create index(:comments, [:post_id])
  end
end
```
> if all looks good, migrate the db:
```sh
$ mix ecto.migrate
```

> now, we need to add a form so people can add comments
>> let's start by first adding a new CommentController.ex
1. `web/controllers/comment_controller.ex`
```elixir
defmodule Teacher.CommentController do
  use Teacher.Web, :controller

  alias Teacher.Post

  # it will take a connection and pattern match to get the comment_params and post_id
  def create(conn, %{"comment" => comment_params, "post_id" => post_id}) do
    # look up post with the post_id
    post = Repo.get(Post, post_id)
    # then, we'll build a comment_changeset which builds an assoc between comment and post and sets the value of the body key from the comment_params
    comment_changeset = Ecto.build_assoc(post, :comments, body: comment_params["body"])

    # insert into db
    Repo.insert(comment_changeset)

    # flash a message & then redirect to the post
    conn
    |> put_flash(:info, "Comment created successfully.")
    |> redirect(to: post_path(conn, :show, post))
  end
end
```
2. `web/views/comment_view.ex`
```elixir
defmodule Teacher.CommentView do
  use Teacher.Web, :view
end
```
3. `web/templates/comment/new.html.eex`
>We’ll use the Phoenix form_for helper passing in our comment changeset and our action, which we’ll define in our routes later.
```eex
<%= form_for @comment_changeset, post_comment_path(@conn, :create, @post), fn f -> %>
  <%= label f, :body, class: "control-label" %>
  <%= text_input f, :body, class: "form-control" %>
  <%= error_tag f, :body %>
  <%= submit "Submit", class: "btn btn-primary" %>
<% end %>
```
4. `web/templates/post/show.html.eex`
> display under posts
```eex
<%= render Teacher.CommentView, "new.html",
                                conn: @conn,
                                post: @post,
                                comment_changeset: @comment_changeset %>
```
5. `web/router.ex`
> add the comments resource just below posts
```elixir
resources "/comments", CommentController
```


#### *Docs & Links*
1. [Episode Source Code](https://github.com/elixircastsio/002-adding-comments-with-ecto-has-many-and-belongs-to)


## [Pragmatic Studio](https://online.pragmaticstudio.com/courses/elixir/)
