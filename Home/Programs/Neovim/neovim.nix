{
  config,
  lib,
  pkgs,
  ...
}: {
  home-manager.users.Aperius.home.packages = with pkgs; [
  ];
}
