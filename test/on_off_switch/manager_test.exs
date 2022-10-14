defmodule OnOffSwitch.ManagerTest do
  use OnOffSwitch.DataCase, async: true

  # By default the state of the switch is set to :off by OnOffSwitch.Application.start/2

  alias OnOffSwitch.Manager
  alias OnOffSwitch.Schemas.SwitchState

  test "get_state/1 returns the switch state from DB" do
    assert %SwitchState{state: :off} = Manager.get_state()
  end

  describe "changes the state from :off to :on and from :on to :off" do
    test "changes the state from :on to :of" do
      assert [%SwitchState{state: :off}] = Repo.all(SwitchState)
      assert Manager.update_state(%SwitchState{state: :on}) == :ok
      assert [%SwitchState{state: :on}] = Repo.all(SwitchState)

      assert Manager.update_state(%SwitchState{state: :off}) == :ok
      assert [%SwitchState{state: :off}] = Repo.all(SwitchState)
    end
  end
end
