use Mix.Config

config :rpitouch, :viewport, %{
  name: :main_viewport,
  # default_scene: {Rpitouch.Scene.SysInfo, nil},
  default_scene: {Rpitouch.Scene.Splash, Rpitouch.Scene.Sensor},
  size: {1000, 600},
  opts: [scale: 1.0],
  drivers: [
    %{
      module: Scenic.Driver.Glfw,
      opts: [resizeable: true, title: "Elixir With Love - Hosts"]
    }
  ]
}
