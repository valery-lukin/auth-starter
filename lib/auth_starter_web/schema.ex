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

  mutation do

    field :update_user, type: :user do
      arg :id, non_null(:integer)
      arg :user, :update_user_params

      resolve &AuthStarter.UserResolver.update/2
    end

    field :create_post, type: :post do
      arg :title, non_null(:string)
      arg :body, non_null(:string)
      arg :user_id, non_null(:integer)

      resolve &AuthStarter.PostResolver.create/2
    end

    field :update_post, type: :post do
      arg :id, non_null(:integer)
      arg :post, :update_post_params

      resolve &AuthStarter.PostResolver.update/2
    end

    field :delete_post, type: :post do
      arg :id, non_null(:integer)

      resolve &AuthStarter.PostResolver.delete/2
    end
  end

end
