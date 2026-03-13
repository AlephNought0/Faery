{pkgs, ...}: {
  faery.user.packages = with pkgs; [
    prismlauncher
    qbittorrent
    vlc
    #onlyoffice-desktopeditors
    qtcreator
    gimp
    keepassxc
    #spotify
    matugen
    tela-icon-theme
    kdePackages.dolphin
    #winetricks
    #wineWow64Packages.yabridge
    zulu25
    element-desktop
  ];
}
