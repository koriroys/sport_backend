defmodule SportBackend.SessionController do
  use SportBackend.Web, :controller

  def index(conn, _params) do
    # filler static json

    conn
    |> json(%{status: "ok"})
  end
end