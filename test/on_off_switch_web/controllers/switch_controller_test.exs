defmodule OnOffSwitchWeb.SwitchControllerTest do
  use OnOffSwitchWeb.ConnCase, async: true

  alias OnOffSwitch.Schemas.SwitchState

  test "show/1 returns state of the switch", %{conn: conn} do
    conn = get(conn, Routes.switch_path(conn, :show))

    assert json_response(conn, 200) == %{"switch_state" => "off"}
  end

  test "create/1 updates the state of the switch and returns 204 status", %{conn: conn} do
    assert [%SwitchState{state: :off}] = OnOffSwitch.Repo.all(SwitchState)

    attrs = %{"state" => "on"}
    conn = patch(conn, Routes.switch_path(conn, :update), attrs)

    assert response(conn, 204)

    assert [%SwitchState{state: :on}] = OnOffSwitch.Repo.all(SwitchState)
  end

  test "create/1 returns 422 error status and does not update the switch state when" <>
         " invalid payload is sent",
       %{conn: conn} do
    assert [%SwitchState{state: :off}] = OnOffSwitch.Repo.all(SwitchState)

    attrs = %{"state" => "invalid_state"}
    conn = patch(conn, Routes.switch_path(conn, :update), attrs)

    assert json_response(conn, 422)["errors"]["detail"] == %{"state" => ["is invalid"]}

    assert [%SwitchState{state: :off}] = OnOffSwitch.Repo.all(SwitchState)
  end
end
