### {}{}{}{}{}ch 7 ecto queries & constraints{}{}{}{}{}
$ `mix phx.gen.schema Multimedia.Category categories name:string`
```
* creating lib/rumbl/multimedia/category.ex
* creating priv/repo/migrations/20180513025558_create_categories.exs
```
migrate
$ `mix ecto.migrate`


### {}{}{}{}{}ch 6 generators & relationships{}{}{}{}{}

$ `phx.gen.html`

> creates a simple HTTP scaffold with HTML pages, and

$ `phx.gen.json`

> does the same for a REST-based API using JSON


> Now our users can safely use category_id in the user input we provide to our changeset. Let’s use mix ecto.gen.migration to build a migration that adds category_id to video:
$ `mix ecto.gen.migration add_category_id_to_video`


> generate the Multimedia context

$ `mix phx.gen.html Multimedia Video videos user_id:references:users url:string title:string description:text`

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


> to share this function between routers and controllers, we need to move it to `RumblWeb.Auth`, call it authenticate_user for clarity, make it public, import our controller functions for `put_flash()` and `redirect()`, and alias our router helpers

authentication/listings/rumbl/lib/rumbl_web/controllers/user_controller.change3.ex
```elixir
defp authenticate(conn, _opts) do
  if conn.assigns.current_user do
    conn
  else
    conn
    |> put_flash(:error, "You must be logged in to access that page")
    |> redirect(to: Routes.page_path(conn, :index))
    |> halt()
  end
end
```

> move to:
relationships/listings/rumbl/lib/rumbl_web/controllers/auth.change1.ex

<!-- iex - test out our assoc -->
$ `ies -S mix`
iex>
```elixir
  {:ok, video} = Rumbl.MultiMedia.create_video(%{title: "ElixirConf 2016 - Collaborative Music with Elm and Phoenix by Josh Adams", url: "https://www.youtube.com/watch?v=UPD8yvl3MUI&t=22s",  description: "In this talk, we'll walk through the design of a collaborative music composition environment using Elm for a frontend that interacts with a Phoenix-channels based backend."})
```
iex> `video.user`
> #Ecto.Association.NotLoaded<association :user is not loaded
need to explicitly preload associations!

> lets explicitly load it:
iex> `video = Rumbl.Repo.preload(video, :user)`
^^^ loads the associated data for you—in this case, :user. After Ecto tries to fetch the association, we can reference the video.user, which returns nil since our video doesn’t yet have an associated user. To make this more meaningful, we need some associated data. Let’s attach a video to one of our users:
iex> `alias Ecto.{Changeset, Repo}`
iex> `user = Rumbl.Accounts.get_user_by(username: "mark")`
%Rumbl.Accounts.User{...}

> Ecto.Changeset.put_assoc allows us to place an association as a change into the changeset with a little less ceremony.
iex>

```elixir
changeset = video |> Changeset.change() |> Changeset.put_assoc(:user, user)
```
 #Ecto.Changeset<...>

iex> `video = Repo.update!(changeset) %Rumbl.Multimedia.Video{...}`
iex> `video.user`
%Rumbl.Accounts.User{username: "mark"}

> This is how you would make the same change without the useful put_assoc function:

iex>
```elixir
  video = \
    video \
    |> Changeset.change()
    |> Changeset.put_change(:user_id, user.id)
    |> Repo.update!()
```
You didn’t even have to remember the specific foreign key for the User associ- ation. Now that our video has a user, let’s try preload again:

iex> `video = Repo.get(Rumbl.Multimedia.Video, video.id)`
iex> `video = Repo.preload(video, :user)`


> Preload is great for bundling data. Other times we may want to fetch the user associated with a video, without storing the user in the video struct, like this:

iex> `query = Ecto.assoc(video, :user)`
assoc is another convenient function from Ecto that returns an Ecto.Query with the user scoped to the given video.

> We convert this query into data by calling Repo.one.

iex> `Repo.one(query)`


iex> `h Repo.`

### {}{}{}{}{}ch 5 Authenticating Users{}{}{}{}{}

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
