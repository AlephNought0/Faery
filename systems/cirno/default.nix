{pkgs, ...}: {
  imports = [
    ./config
    ./packages
    ./fonts
  ];

  faery = {
    home-manager = {
      enable = true;
      enableDirenv = true;
    };

    system = {
      username = "Aperius";
      hostname = "Cirno";
      extraGroups = ["corectrl"];

      hardware = {
        gpu.type = "amd";
        cpu.type = "amd";
        logitech.enable = true;
        bluetooth.enable = true;
      };

      services = {
        zerotier = {
          enable = true;
          networks = [
            "e3918db4835d47eb"
            "6ab565387af26e69"
            "3efa5cb78a253dd2"
          ];
        };

        ssh.enable = true;
        polkit.enable = true;
        pipewire.enable = true;
        asusd.enable = true;
      };

      performance = {
        cpu_sched = false;
        io_sched = true;
        kernel = true;
      };
    };

    xdg = {
      enable = true;
      default_browser = "firefox-nightly.desktop";
      default_editor = "nvim.desktop";
      default_terminal = "foot";
    };

    theme.qt = {
      enable = true;
      platformTheme = "qt5ct";
      style = "kvantum";
    };

    programs = {
      browsers = {
        firefox = {
          enable = true;
          dGPU = true;
        };
      };

      hyprland = {
        enable = true;
        scaling = "1.6";
      };

      niri.enable = true;

      kdeWithoutPlasma = {
        enable = true;
        packages = with pkgs; [
          libsForQt5.dolphin
        ];
      };

      terminals = {
        foot.enable = true;
      };

      displaymanager.sddm.enable = true;

      nvf.enable = true;
      vesktop.enable = true;
      steam.enable = true;
      opentablet.enable = true;
      corectrl.enable = true;
      easyeffects.enable = true;
      btop.enable = true;
    };
  };
}
