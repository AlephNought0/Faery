{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}: {
  home-manager.users.Aperius.home.packages = with pkgs; [
    neofetch
    wget
    git
    curl
    asusctl
    amdgpu_top
  ];
}
