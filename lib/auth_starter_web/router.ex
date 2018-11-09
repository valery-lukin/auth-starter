defmodule AuthStarterWeb.Router do
  use AuthStarterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AuthStarterWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/posts", PostController, except: [:new, :edit]
  end

  forward "/api", Absinthe.Plug,
    schema: AuthStarterWeb.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: AuthStarterWeb.Schema
end
