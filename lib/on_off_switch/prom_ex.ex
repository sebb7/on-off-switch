defmodule OnOffSwitch.PromEx do
  @moduledoc false

  use PromEx, otp_app: :on_off_switch

  alias PromEx.Plugins

  @impl true
  def plugins do
    [
      Plugins.Application,
      Plugins.Beam,
      {Plugins.Phoenix, router: OnOffSwitchWeb.Router, endpoint: OnOffSwitchWeb.Endpoint},
      Plugins.Ecto

      # Add your own PromEx metrics plugins
    ]
  end

  @impl true
  def dashboard_assigns do
    [
      datasource_id: "Prometheus",
      default_selected_interval: "30s"
    ]
  end

  @impl true
  def dashboards do
    [
      # PromEx built in Grafana dashboards
      {:prom_ex, "application.json"},
      {:prom_ex, "beam.json"},
      {:prom_ex, "phoenix.json"},
      {:prom_ex, "ecto.json"}

      # Add your dashboard definitions here with the format: {:otp_app, "path_in_priv"}
      # {:on_off_switch, "/grafana_dashboards/user_metrics.json"}
    ]
  end
end
