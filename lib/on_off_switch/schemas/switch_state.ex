defmodule OnOffSwitch.Schemas.SwitchState do
  use Ecto.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{}

  schema "switch_state" do
    field :state, Ecto.Enum, values: [on: 1, off: 0]
  end

  @spec changeset(t, map) :: Ecto.Changeset.t()
  def changeset(state, attrs) do
    cast(state, attrs, [:state])
  end

  @spec new(map) :: {:ok, t}
  def new(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
    |> apply_action(:new)
  end
end
