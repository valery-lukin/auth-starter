defmodule AuthStarter.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias AuthStarter.Accounts.User


  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :role, :string, default: "user"
    field :password, :string, virtual: true
    field :password_hash, :string
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

  def update_changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, [:username, :email, :first_name, :last_name, :role, :password])
    |> validate_required([:username, :email, :first_name, :last_name])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> put_pass_hash()
  end

  def registration_changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> put_pass_hash
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
      _ -> changeset
    end
  end
end
