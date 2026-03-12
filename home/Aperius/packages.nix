{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [
      prismlauncher
      qbittorrent
      obs-studio
      krita
      vlc
      onlyoffice-desktopeditors
      qtcreator
      r2modman
      gimp
      keepassxc
      spotify
      matugen
      telegram-desktop
      reaper
      amdgpu_top
      tela-icon-theme
      kdePackages.dolphin
      oversteer
      libnotify
      equibop
      winetricks
      wineWow64Packages.yabridge
      zulu25
      moonlight-qt
      element-desktop
      wootility
      sunshine
      bottles
    ];
  };
}
