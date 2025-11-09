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
  ];

  faery = {
    hardware = {
      gpu = "amd";
      cpu = "amd";

      audio.pipewire.enable = true;
      mouse.logitech-wireless.enable = true;
    };

    system = {
      performance = {
        cpu_sched = true;
        io_sched = true;
        kernel = true;
        systemd = true;
      };
    };

    theme.qt = {
      enable = true;
      nordic = true;
      iconTheme = "Tela-black";
      appTheme = "Nordic-Darker";
      platformTheme = "qtct";
      style = "kvantum";
      colorScheme = "darker";
    };

    services = {
      syncthing.enable = true;
      flatpak.enable = true;
      polkit.enable = true;
    };

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
      };

      browsers = {
        firefox.enable = true;
        floorp.enable = true;
      };

      wms.niri.enable = true;
      displayManagers.sddm.enable = true;

      mullvad.enable = true;
      vesktop.enable = true;
      steam.enable = true;
      opentablet.enable = true;
      easyeffects.enable = true;
    };

    overlays = {
      dolphin.no-alternate = true;
    };

    user.useHomeManager = true;
    terminal.shell.zsh = true;
    virtualization.qemu.enable = true;
    kdeWithoutPlasma.enable = true;
  };
}
