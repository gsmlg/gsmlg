defmodule GSMLGWeb.Router do
  use GSMLGWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  scope "/api", GSMLGWeb do
    pipe_through :api

    get "/nodes", NodeController, :index
    resources "/blogs", BlogController, only: [:index, :create, :update, :show]

  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: GSMLGWeb.Telemetry
    end
  end

  scope "/", GSMLGWeb do
    pipe_through :browser # Use the default browser stack

    get "/*not_found", PageController, :not_found
  end
end
