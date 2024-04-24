{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}: {
  home-manager.users.Aperius.home.packages = with pkgs; [
    firefox
  ];
}
