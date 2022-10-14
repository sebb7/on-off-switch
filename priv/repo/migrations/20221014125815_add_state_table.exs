defmodule OnOffSwitch.Repo.Migrations.AddStateTable do
  use Ecto.Migration

  def change do
    create table("switch_state") do
      add :state, :integer
    end
  end
end
