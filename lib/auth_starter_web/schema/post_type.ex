defmodule AuthStarterWeb.Schema.Types.PostType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: AuthStarter.Repo

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
    field :user, :user, resolve: assoc(:user)
  end

  input_object :update_post_params do
    field :title, :string
    field :body, :string
    field :user_id, non_null(:integer)
  end

end
