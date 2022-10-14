defmodule OnOffSwitchWeb.SwitchController do
  use OnOffSwitchWeb, :controller

  def show(conn, _) do
    render(conn, "show.json", switch_state: "off")
  end
end
