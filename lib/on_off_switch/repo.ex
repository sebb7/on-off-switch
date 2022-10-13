defmodule OnOffSwitch.Repo do
  use Ecto.Repo,
    otp_app: :on_off_switch,
    adapter: Ecto.Adapters.Postgres
end
