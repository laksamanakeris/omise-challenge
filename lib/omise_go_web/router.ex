defmodule OmiseGoWeb.Router do
  use OmiseGoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", OmiseGoWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/github-search/:query", GithubSearchController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", OmiseGoWeb do
    pipe_through :api

    post "/converter", ConverterController, :index
    get "/health", PageController, :health
  end
end
