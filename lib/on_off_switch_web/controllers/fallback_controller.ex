defmodule OnOffSwitchWeb.FallbackController do
  use OnOffSwitchWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(OnOffSwitchWeb.ErrorView)
    |> render("error.json", %{changeset: changeset})
  end
end
