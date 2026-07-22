{
  pkgs,
  inputs,
  ...
}: {
  faery.user.packages = with pkgs; [
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
    wine64Packages.staging
    zulu25
    moonlight-qt
    element-desktop
    wootility
    graphicsmagick
    blender
    eden
    #burpsuite
    inputs.burpsuite-pro.packages.${pkgs.stdenv.hostPlatform.system}.default
    nodejs_26
    claude-code
  ];

  programs.appimage = {
    enable = true;
    binfmt = true;

    package = pkgs.appimage-run.override {
      extraPkgs = pkgs: [pkgs.icu];
    };
  };

  nixpkgs.config.permittedInsecurePackages = [
    "electron-40.10.5"
  ];
}
