use Mix.Config

config :logger, backends: [RingLogger]

key_mgmt = System.get_env("NERVES_NETWORK_KEY_MGMT") || "WPA-PSK"

config :nerves_network, :default,
  wlan0: [
    ssid: "nombre de red",
    psk: "password",
    key_mgmt: String.to_atom(key_mgmt),
    ipv4_address_method: :static,
    ipv4_address: "192.168.0.123",
    ipv4_subnet_mask: "255.255.255.0",
    nameservers: ["8.8.8.8", "8.8.4.4"]
  ]

config :nerves_firmware_ssh,
  authorized_keys: [
    File.read!(Path.join(System.user_home!, ".ssh/id_rsa.pub"))
  ]

config :nerves_init_gadget,
  ifname: "wlan0",
  address_method: :static,
  mdns_domain: nil,
  node_name: "rpi",
  node_host: "192.168.0.123",
  ssh_console_port: 22


config :rpitouch, :viewport, %{
  name: :main_viewport,
  # default_scene: {Rpitouch.Scene.Crosshair, nil},
  default_scene: {Rpitouch.Scene.SysInfo, nil},
  size: {800, 480},
  opts: [scale: 1.0],
  drivers: [
    %{
      module: Scenic.Driver.Nerves.Rpi
    },
    %{
      module: Scenic.Driver.Nerves.Touch,
      opts: [
        device: "FT5406 memory based drive",
        calibration: {{1, 0, 0}, {1, 0, 0}}
      ]
    }
  ]
}
