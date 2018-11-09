defmodule AuthStarter.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :role, :string, default: "user"
    field :username, :string
    has_many :posts, AuthStarter.Posts.Post
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :first_name, :last_name, :role])
    |> validate_required([:username, :email, :first_name, :last_name])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end
end
