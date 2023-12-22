{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    zerotierone
  ];

  services.zerotierone.enable = true;
  services.zerotierone.joinNetworks = [
    "3efa5cb78a61e879"
  ];
}
