{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.networkmanager.enable = true;

  networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 80 443 9993 25565 ]; #25565 is port for minecraft server
  allowedUDPPorts = [ 34197 ]; #34197 is port for factorio server
  allowedUDPPortRanges = [
    { from = 4000; to = 4007; }
    { from = 8000; to = 8010; }
  ];
};
}
