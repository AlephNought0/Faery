{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}: {
  home-manager.users.Aperius.home.packages = with pkgs; [
    opentabletdriver
  ];

  hardware.opentabletdriver.enable = true;
}
