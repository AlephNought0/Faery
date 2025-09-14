{
  config,
  pkgs,
  ...
}: let
  #inherit (lib) concatLists;
  inherit (config.faery.system) username;
in {
  home-manager.users."${username}".home.packages = with pkgs; [
    prismlauncher
    qbittorrent
    obs-studio
    krita
    vlc
    libreoffice-qt6-still
    qtcreator
    r2modman
    gimp
    keepassxc
    spotify
    protontricks
    matugen
    #jdk17
    jdk8
    wl-gammarelay-rs
    telegram-desktop
    nix-output-monitor
    reaper

    asusctl
    amdgpu_top
  ];
}
