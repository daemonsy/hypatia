# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hypatia,
  ecto_repos: [Hypatia.Repo]

# Configures the endpoint
config :hypatia, HypatiaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r6uaBiP4gsV0FyqZYtdbVwLv05yu12IPzxnDVWu9Jz1OR9vsND6wmTgvq75ADf9N",
  render_errors: [view: HypatiaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hypatia.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
