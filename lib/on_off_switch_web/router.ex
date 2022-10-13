defmodule OnOffSwitchWeb.Router do
  use OnOffSwitchWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", OnOffSwitchWeb do
    pipe_through :api
  end
end
