defmodule Rpitouch.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  @target Mix.Project.config()[:target]

  use Application

  def start(_type, _args) do
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SnTest.Supervisor]
    Supervisor.start_link(children(@target), opts)
  end

  # List all child processes to be supervised
  def children("host") do
    import Supervisor.Spec, warn: false
    main_viewport_config = Application.get_env(:rpitouch, :viewport)

    [
      supervisor(Rpitouch.Sensor.Supervisor, []),
      supervisor(Scenic, viewports: [main_viewport_config])
    ]
  end

  def children(_target) do
    import Supervisor.Spec, warn: false
    main_viewport_config = Application.get_env(:rpitouch, :viewport)

    [
      supervisor(Rpitouch.Sensor.Supervisor, []),
      supervisor(Scenic, viewports: [main_viewport_config])
    ]
  end
end
