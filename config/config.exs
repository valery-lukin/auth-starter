# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :auth_starter,
  ecto_repos: [AuthStarter.Repo]

# Configures the endpoint
config :auth_starter, AuthStarterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AoVI36bWZfwYA2o8lNClwx8i+24PQelv22bJJAXWmqGois89GJCn9HUtQxDAsTgA",
  render_errors: [view: AuthStarterWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: AuthStarter.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configures Guardian
config :auth_starter, AuthStarter.Guardian,
  issuer: "auth_starter",
  secret_key: "E/56psFssq5ePbqaJe0yfo5PTbKznsmpLVMrK6tNMNYc8BMNkTI6DGTbW8Bu0G/o"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
