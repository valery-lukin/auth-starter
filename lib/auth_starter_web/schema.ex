defmodule AuthStarterWeb.Schema  do
  use Absinthe.Schema
  import_types AuthStarterWeb.Schema.Types

  query do
    field :posts, list_of(:post) do
      resolve &AuthStarter.PostResolver.all/2
    end

    field :users, list_of(:user) do
      resolve &AuthStarter.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &AuthStarter.UserResolver.find/2
    end
  end

end
