defmodule Acortador.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Acortador.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Acortador.PubSub}
      # Start a worker by calling: Acortador.Worker.start_link(arg)
      # {Acortador.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Acortador.Supervisor)
  end
end
