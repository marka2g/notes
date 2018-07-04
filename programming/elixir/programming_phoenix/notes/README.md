### ch 6 generators & relationships

$ `phx.gen.html`

> creates a simple HTTP scaffold with HTML pages, and

$ `phx.gen.json`

> does the same for a REST-based API using JSON


> generate the Multimedia context

$ `mix phx.gen.html Multimedia Video videos user_id:references:users \`
`url:string title:string description:text`

...
```
* creating lib/rumbl_web/controllers/video_controller.ex
* creating lib/rumbl_web/templates/video/edit.html.eex
* creating lib/rumbl_web/templates/video/form.html.eex
* creating lib/rumbl_web/templates/video/index.html.eex
* creating lib/rumbl_web/templates/video/new.html.eex
* creating lib/rumbl_web/templates/video/show.html.eex
* creating lib/rumbl_web/views/video_view.ex
* creating test/rumbl_web/controllers/video_controller_test.exs
* creating lib/rumbl/multimedia/video.ex
* creating priv/repo/migrations/20180704025952_create_videos.exs
* creating lib/rumbl/multimedia/multimedia.ex
* injecting lib/rumbl/multimedia/multimedia.ex
* creating test/rumbl/multimedia/multimedia_test.exs
* injecting test/rumbl/multimedia/multimedia_test.exs
```

$ `mix ecto.migrate`

### {}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}
### ch 5 Authenticating Users.

need to rollback migration, how? can't in ecto
$ `mix ecto.rollback`

#### ch 5, lets take credential for a spin:

$ `ies -S mix`
iex> `alias Rumbl.Accounts.User`
iex> `changeset = User.registration_changeset(%User{}, %{username: "max", name: "Max", credential: %{password: "123"}})`

iex> `changeset.valid?`
false

iex(4)> `changeset.changes`
```elixir
 %{
   credential: #Ecto.Changeset<
     action: :insert,
     changes: %{password: "123"},
     errors: [
       password: {"should be at least %{count} character(s)",
        [count: 6, validation: :length, min: 6]},
       email: {"can't be blank", [validation: :required]}
     ],
     data: #Rumbl.Accounts.Credential<>,
     valid?: false
   >,
   name: "Max",
   username: "max"
 }
```
valid

iex> `changeset = User.registration_changeset(%User{}, %{username: "max", name: "Max", credential: %{email: "max@maximum.com", password: "secret123"}})`
iex > `changeset.valid?`
true

iex(9)> `changeset.changes`
```elixir
 %{
   credential: #Ecto.Changeset<
     action: :insert,
     changes: %{
       email: "max@maximum.com",
       password: "secret123",
       password_hash: "$2b$12$liKas3p29gztYTc14/F30e8OFdRXX5jEk8ayj6W5dUpsqc.4D7Tg6"
     },
     errors: [],
     data: #Rumbl.Accounts.Credential<>,
     valid?: true
   >,
   name: "Max",
   username: "max"
 }
 ```
