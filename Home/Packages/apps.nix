{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:  {
  home-manager.users.Aperius.home.packages = with pkgs; [
    inputs.prismlauncher.packages."${pkgs.system}".prismlauncher
    inputs.quickshell.packages."${pkgs.system}".quickshell
    qbittorrent
    obs-studio
    krita
    vscodium-fhs
    vlc
    libreoffice-qt
    #jetbrains.clion
    #jetbrains.rider
    qtcreator
    qpwgraph
    arrpc
    r2modman
    protontricks
    wineWowPackages.waylandFull
    gimp
    brave
    keepassxc
    spotube
    thunderbird

    libsForQt5.qt5ct
    qt6Packages.qt6ct
    tela-icon-theme
    libsForQt5.qtstyleplugin-kvantum
  ];
}
