{
  networking = {
    networkmanager.enable = true;
    nameservers = ["1.1.1.1" "1.0.0.1"];

    firewall = {
      enable = true;

      allowedTCPPorts = [
        80
        443
        25565 # Minecraft
        22000 # Syncthing
      ];

      allowedUDPPorts = [
        34197 # Factorio
        21027 # Syncthing
        9993 # Zerotier
      ];

      allowedUDPPortRanges = [
        {
          from = 4000;
          to = 4007;
        }
        {
          from = 8000;
          to = 8010;
        }
      ];
    };
  };
}
