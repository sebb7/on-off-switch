defmodule OnOffSwitchWeb.SwitchView do
  use OnOffSwitchWeb, :view

  def render("show.json", %{switch_state: state}) do
    %{switch_state: state}
  end
end
