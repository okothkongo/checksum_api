defmodule ChecksumApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: ChecksumApi.Worker.start_link(arg)
      {ChecksumApi.Server, {ChecksumApi.Core.new(), :checksum_api}},
      {Plug.Cowboy, scheme: :http, plug: ChecksumApi.Endpoint, port: 4000}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChecksumApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
