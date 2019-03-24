defmodule OmiseGoWeb.GithubSearchController do
  use OmiseGoWeb, :controller

  action_fallback OmiseGoWeb.FallbackController

  alias OmiseGo.GithubSearch

  def index(conn, params) do
    page_num = Map.get(params, "page", "1") |> String.to_integer
    per_page = Map.get(params, "per_page", "100") |> String.to_integer
    query = params["query"]

    case GithubSearch.query_page(query, page_num, per_page) do
      {:ok, page} -> 
        render(conn, "github.html", query: query, page: page)
      {:error, message} ->
        conn
        |> put_status(404)
        |> render("notfound.html", message: message)
    end

  end

end
