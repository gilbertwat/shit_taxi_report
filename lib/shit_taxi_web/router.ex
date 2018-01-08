defmodule ShitTaxiWeb.Router do
  use ShitTaxiWeb, :router

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

  scope "/", ShitTaxiWeb do
    pipe_through :browser # Use the default browser stack
    get "/shittaxi", ShitTaxiController, :index
    post "/shittaxi", ShitTaxiController, :create
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", ShitTaxiWeb do
    pipe_through :api
    get "/all", ShitTaxiController, :show
    get "/one", ShitTaxiController, :one
  end
end
