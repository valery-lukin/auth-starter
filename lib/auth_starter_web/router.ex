defmodule AuthStarterWeb.Router do
  use AuthStarterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug AuthStarterWeb.Plugs.Context
  end

  scope "/api" do
    pipe_through :api

    forward("/graphql", Absinthe.Plug, schema: AuthStarterWeb.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL, schema: AuthStarterWeb.Schema)
    end
  end

end
