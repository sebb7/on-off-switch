defmodule OnOffSwitch.Manager do
  alias OnOffSwitch.Repo
  alias OnOffSwitch.Schemas.SwitchState

  @spec get_state() :: SwitchState.t()
  def get_state do
    [state] = Repo.all(SwitchState)
    state
  end

  @spec update_state(SwitchState.t()) :: :ok
  def update_state(new_state) do
    [current_state] = Repo.all(SwitchState)

    current_state
    |> Ecto.Changeset.change(state: new_state.state)
    |> Repo.update()

    :ok
  end
end
