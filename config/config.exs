# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :gsmlg,
  namespace: GSMLG,
  ecto_repos: [GSMLG.Repo]

config :gsmlg_web,
  namespace: GSMLGWeb,
  ecto_repos: [GSMLG.Repo],
  generators: [context_app: :gsmlg]

# Configures the endpoint
config :gsmlg_web, GSMLGWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pdkhMGknLjkbG3h2P2LxXScLVVvLKPEVcmJrb6MxUwuKFcPT4EfukRlpjrqTaU/j",
  render_errors: [view: GSMLGWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GSMLG.PubSub,
  live_view: [signing_salt: "TeMAXcaz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
