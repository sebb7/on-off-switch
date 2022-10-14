defmodule OnOffSwitchWeb.SwitchController do
  use OnOffSwitchWeb, :controller

  require Logger

  alias OnOffSwitch.Manager
  alias OnOffSwitch.Schemas.SwitchState

  action_fallback OnOffSwitchWeb.FallbackController

  def show(conn, _) do
    %SwitchState{state: state} = Manager.get_state()

    render(conn, "show.json", switch_state: state)
  end

  def update(conn, params) do
    Logger.info("Recived switch state update request")
    with {:ok, state} <- SwitchState.new(params) do
      Manager.update_state(state)
      send_resp(conn, 204, "")
    end
  end
end
