defmodule SportBackend.Router do
  use SportBackend.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json-api"]
  end

  scope "/", SportBackend do
    pipe_through :api

    resources "session", SessionController, only: [:index]
    resources "/exercises", ExerciseController, except: [:new, :edit]

    ####################################################################
    # pipe_through :browser
    # Use the default browser stack
    ####################################################################
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", SportBackend do
  #   pipe_through :api
  # end
end
