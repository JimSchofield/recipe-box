defmodule RecipeBox.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      RecipeBox.Repo,
      # Start the Telemetry supervisor
      RecipeBoxWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RecipeBox.PubSub},
      # Start the Endpoint (http/https)
      RecipeBoxWeb.Endpoint
      # Start a worker by calling: RecipeBox.Worker.start_link(arg)
      # {RecipeBox.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RecipeBox.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RecipeBoxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
