defmodule BapiWeb.Router do
  use BapiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BapiWeb do
    pipe_through :api
  end
end
