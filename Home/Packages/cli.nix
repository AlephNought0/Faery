{
  config,
  lib,
  pkgs,
  ...
}: {
  home-manager.users.Aperius.home.packages = with pkgs; [
    hyfetch
    wget
    git
    curl
    asusctl
    amdgpu_top
  ];
}
