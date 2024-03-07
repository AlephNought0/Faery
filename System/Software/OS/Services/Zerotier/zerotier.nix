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
    "e3918db4835d47eb"
  ];
}
