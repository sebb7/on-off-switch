defmodule OnOffSwitchWeb.Router do
  use OnOffSwitchWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", OnOffSwitchWeb do
    pipe_through :api

    get "/switch", SwitchController, :show
    patch "/switch", SwitchController, :update
  end
end
