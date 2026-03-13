{
  imports = [
    ./fonts.nix
    ./hardware-config.nix
    ./kernel.nix
    ./network.nix
    ./users.nix
    ./bootloader.nix
    ./misc.nix
    ./services.nix
    ./packages.nix
  ];

  faery = {
    hardware.audio.pipewire.enable = true;

    theme.qt = {
      enable = true;
      nordic = true;
      iconTheme = "Tela-black";
      appTheme = "Nordic-Darker";
      platformTheme = "qtct";
      style = "kvantum";
      colorScheme = "darker";
    };

    services.syncthing.enable = true;

    xdg = {
      enable = true;
      default_browser = "firefox-nightly.desktop";
      default_editor = "nvim.desktop";
      default_fileManager = "dolphin.desktop";
      default_terminal = "foot";
    };

    programs = {
      tui = {
        nvf.enable = true;
        btop.enable = true;
        nh.enable = true;
      };

      browsers = {
        firefox.enable = true;
        floorp.enable = true;
      };

      wms.niri.enable = true;
      displayManagers.sddm.enable = true;

      mullvad.enable = true;
      vesktop.enable = true;
      #steam.enable = true;
      opentablet.enable = true;
      easyeffects.enable = true;
      quickshell.enable = true;
    };

    overlays = {
      dolphin.no-alternate = true;
      quickshell = true;
    };

    user.useHomeManager = true;
    terminal.shell.zsh = true;
    kdeWithoutPlasma.enable = true;
  };
}
