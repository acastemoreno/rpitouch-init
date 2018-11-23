use Mix.Config

config :rpitouch, :viewport, %{
  name: :main_viewport,
  # default_scene: {Rpitouch.Scene.Crosshair, nil},
  default_scene: {Rpitouch.Scene.SysInfo, nil},
  size: {800, 480},
  opts: [scale: 1.0],
  drivers: [
    %{
      module: Scenic.Driver.Glfw,
      opts: [title: "MIX_TARGET=host, app = :rpitouch"]
    }
  ]
}
