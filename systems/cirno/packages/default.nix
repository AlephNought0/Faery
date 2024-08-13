{
  config,
  pkgs,
  inputs,
  ...
}: let
  inherit (config.faery.system) username;
in {
  home-manager.users."${username}".home.packages = with pkgs; [
    inputs.prismlauncher.packages."${pkgs.system}".prismlauncher
    inputs.quickshell.packages."${pkgs.system}".quickshell
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    qbittorrent
    obs-studio
    krita
    vlc
    libreoffice-qt6-fresh
    qtcreator
    r2modman
    gimp
    keepassxc
    spotube
    element-desktop
    kdePackages.oxygen-icons

    git
    asusctl
    amdgpu_top
  ];
}
