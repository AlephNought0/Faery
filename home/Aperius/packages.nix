{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [
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
      jdk8
      telegram-desktop
      reaper
      asusctl
      amdgpu_top
      mullvad-vpn
      tela-icon-theme
      kdePackages.dolphin
    ];
  };
}
