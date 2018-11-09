defmodule AuthStarterWeb.Router do
  use AuthStarterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AuthStarterWeb do
    pipe_through :api
  end
end
