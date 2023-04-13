defmodule Bapi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BapiWeb.Telemetry,
      # Start the Ecto repository
      Bapi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Bapi.PubSub},
      # Start the Endpoint (http/https)
      BapiWeb.Endpoint
      # Start a worker by calling: Bapi.Worker.start_link(arg)
      # {Bapi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bapi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BapiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
