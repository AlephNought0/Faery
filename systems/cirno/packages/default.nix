{ config, pkgs, inputs, ... }:
let
  inherit (config.faery.system) username;
in
{
  home-manager.users."${username}".home.packages = with pkgs; [
    inputs.prismlauncher.packages."${pkgs.system}".prismlauncher
    inputs.quickshell.packages."${pkgs.system}".quickshell
    qbittorrent
    obs-studio
    krita
    vscodium-fhs
    vlc
    libreoffice-qt
    qtcreator
    r2modman
    gimp
    keepassxc
    spotube
    easyeffects
    element-desktop

    git
    asusctl
    amdgpu_top
  ];
}
