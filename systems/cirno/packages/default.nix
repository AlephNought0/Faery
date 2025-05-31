{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  inherit (lib) concatLists;
  inherit (config.faery.system) username;
in {
  home-manager.users."${username}".home.packages = with pkgs; [
    (inputs.quickshell.packages."${pkgs.system}".quickshell.overrideAttrs (old: {
      patches = concatLists [
        (old.patches or [])
        [./quickpatch.patch]
      ];
    }))
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
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
    spotube
    protontricks
    matugen
    jdk17
    wl-gammarelay-rs
    telegram-desktop
    nix-output-monitor

    git
    asusctl
    amdgpu_top
  ];
}
