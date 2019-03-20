defmodule OmiseGoWeb.GithubSearchController do
  use OmiseGoWeb, :controller

  action_fallback OmiseGoWeb.FallbackController

  alias OmiseGo.GithubSearch

  def index(conn, params) do
    page_num = Map.get(params, "page", "1") |> String.to_integer
    per_page = Map.get(params, "per_page", "100") |> String.to_integer
    search = params["query"]

    {_status, response} = GithubSearch.query_page(search, page_num, per_page)

    json(conn, response) 
  end

end
