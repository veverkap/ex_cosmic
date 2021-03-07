# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex_cosmic,
  ecto_repos: [ExCosmic.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :ex_cosmic, ExCosmicWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YnFc61tLF/tF+T7Dsk4eIBGyG/g3LCQ7FZkyWFkcyIQ60UsWYoaH1IZF0bmkPXxW",
  render_errors: [view: ExCosmicWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ExCosmic.PubSub,
  live_view: [signing_salt: "I09q2N7U"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
