{
  config,
  lib,
  pkgs,
  ...
}: {
  networking = {
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" "1.0.0.1" ];

    firewall = {
      enable = true;

      allowedTCPPorts = [ 80 443 9993 25565 ]; #25565 is port for minecraft server
      allowedUDPPorts = [ 34197 ]; #34197 is port for factorio server
      allowedUDPPortRanges = [
        { from = 4000; to = 4007; }
        { from = 8000; to = 8010; }
      ];
    };
  };

  services.dnsmasq = {
    enable = true;

    settings.server = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };
}

