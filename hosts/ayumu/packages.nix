{pkgs, ...}: {
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
    #equibop
    winetricks
    wine64Packages.staging
    zulu25
    moonlight-qt
    element-desktop
    wootility
    graphicsmagick
    blender
    eden
    nodejs_26
    claude-code
    ckan
    qview

    ((equibop.override {electron_43 = electron_45;}).overrideAttrs (finalAttrs: prev: {
      version = "3.3.4";
      src = prev.src.override {
        tag = "v${finalAttrs.version}";
        hash = "sha256-wsaVqBYETYFTsG78UInY5Z6VvUr8RLWMC8/eW8lTldY=";
      };
      node-modules = prev.node-modules.overrideAttrs {outputHash = "sha256-Gtsy22jI9y6a8NB/bRR4j1z1PwFlfJPzIPznr7fLb8M=";};

      postPatch = ''
        substituteInPlace scripts/build/build.mts \
          --replace-fail 'gitHash = execSync("git rev-parse HEAD", { encoding: "utf-8" }).trim();' 'gitHash = "${finalAttrs.src.hash}"'

        substituteInPlace src/main/updater.ts \
          --replace-fail 'const isOutdated = autoUpdater.checkForUpdates().then(res => Boolean(res?.isUpdateAvailable));' 'const isOutdated = false;'
      '';

      buildPhase = builtins.replaceStrings ["bun run compileArrpc"] [""] prev.buildPhase;
    }))
  ];

  programs = {
    nix-ld.enable = true;
    appimage = {
      enable = true;
      binfmt = true;

      package = pkgs.appimage-run.override {
        extraPkgs = pkgs: [pkgs.icu];
      };
    };
  };

  nixpkgs.config.permittedInsecurePackages = [
    "electron-40.10.5"
  ];
}
