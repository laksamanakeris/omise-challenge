defmodule OmiseGoWeb.PageController do
  use OmiseGoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
