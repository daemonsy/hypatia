defmodule HypatiaWeb.Router do
  use HypatiaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  forward "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: Hypatia.Graph.Schema,
    interface: :simple

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HypatiaWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", HypatiaWeb do
  #   pipe_through :api
  # end
end
