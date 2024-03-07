{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.networkmanager.enable = true;

  networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 80 443 9993 25565 ];
  allowedUDPPortRanges = [
    { from = 4000; to = 4007; }
    { from = 8000; to = 8010; }
  ];
};
}
