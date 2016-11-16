defmodule SportBackend.PageController do
  use SportBackend.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
