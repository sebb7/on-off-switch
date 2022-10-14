defmodule OnOffSwitch.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias OnOffSwitch.Schemas.SwitchState

  @impl true
  def start(_type, _args) do
    OpentelemetryEcto.setup([:on_off_switch, :repo])
    OpentelemetryPhoenix.setup()

    children = [
      OnOffSwitch.PromEx,
      # Start the Ecto repository
      OnOffSwitch.Repo,
      # Start the Telemetry supervisor
      OnOffSwitchWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: OnOffSwitch.PubSub},
      # Start the Endpoint (http/https)
      OnOffSwitchWeb.Endpoint
      # Start a worker by calling: OnOffSwitch.Worker.start_link(arg)
      # {OnOffSwitch.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OnOffSwitch.Supervisor]
    start_result = Supervisor.start_link(children, opts)

    ensure_switch_statet_in_db()

    start_result
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OnOffSwitchWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp ensure_switch_statet_in_db do
    if OnOffSwitch.Repo.all(SwitchState) == [] do
      %SwitchState{}
      |> SwitchState.changeset(%{state: :off})
      |> OnOffSwitch.Repo.insert()
    end

    {:ok, :ok}
  end
end
