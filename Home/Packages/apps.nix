{
  config,
  lib,
  pkgs,
  inputs,
  osConfig,
  ...
}: {
  home-manager.users.Aperius.home.packages = with pkgs; [
    inputs.prismlauncher.packages."${pkgs.system}".prismlauncher
    qbittorrent
    obs-studio
    krita
    vscodium-fhs
    vlc
    libreoffice-qt
    ciscoPacketTracer8
    libsForQt5.kate
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    jetbrains.clion
    jetbrains.rider
    #pgadmin4
    qtcreator
    qpwgraph
    arrpc
    r2modman
  ];
}
