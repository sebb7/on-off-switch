# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :on_off_switch,
  ecto_repos: [OnOffSwitch.Repo]

# Configures the endpoint
config :on_off_switch, OnOffSwitchWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: OnOffSwitchWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: OnOffSwitch.PubSub,
  live_view: [signing_salt: "jyOwSgRt"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id, :span_id, :trace_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :opentelemetry, :resource, service: %{name: "on_off_switch"}


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
