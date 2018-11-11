defmodule AuthStarterWeb.Schema  do
  use Absinthe.Schema
  import_types AuthStarterWeb.Schema.Types

  alias AuthStarterWeb.Schema.Middleware

  query do

    field :users, list_of(:user) do
      middleware(Middleware.Authorize, "admin")
      resolve &AuthStarter.UserResolver.all/3
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &AuthStarter.UserResolver.find/2
    end

    field :posts, list_of(:post) do
      resolve &AuthStarter.PostResolver.all/2
    end
  end

  mutation do
    @desc "Updates user"
    field :update_user, type: :user do
      arg :id, non_null(:integer)
      arg :user, :update_user_params

      resolve &AuthStarter.UserResolver.update/2
    end

    @desc "Login user and return token"
    field :login_user, type: :session_type do
      arg :input, non_null(:session_input_type)

      resolve &AuthStarter.SessionResolver.login_user/3
    end

    # Posts section
    @desc "Creates new Post"
    field :create_post, type: :post do
      arg :title, non_null(:string)
      arg :body, non_null(:string)
      arg :user_id, non_null(:integer)

      resolve &AuthStarter.PostResolver.create/2
    end

    @desc "Updates existing Post"
    field :update_post, type: :post do
      arg :id, non_null(:integer)
      arg :post, :update_post_params

      resolve &AuthStarter.PostResolver.update/2
    end

    @desc "Deletes Post"
    field :delete_post, type: :post do
      arg :id, non_null(:integer)

      resolve &AuthStarter.PostResolver.delete/2
    end
  end

end
