defmodule AuthStarterWeb.Schema.Types.UserType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: AuthStarter.Repo

  object :user do
    field :id, :id
    field :username, :string
    field :first_name, :string
    field :last_name, :string
    field :role, :string
    field :email, :string
    field :posts, list_of(:post), resolve: assoc(:posts)
  end

  input_object :update_user_params do
    field :username, :string
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password, :string
    field :role, :string
  end

end
