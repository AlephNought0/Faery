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
        syncthing.enable = true;
      };

      performance = {
        cpu_sched = true;
        io_sched = true;
        kernel = true;
        systemd = true;
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
      nordic = true;
      iconTheme = "Tela-black";
      appTheme = "Nordic-Darker";
      platformTheme = "qt5ct";
      style = "kvantum";
      packages = with pkgs; [
        tela-icon-theme
      ];
    };

    programs = {
      browsers = {
        firefox = {
          enable = true;
          dGPU = true;
        };
      };

      kdeWithoutPlasma = {
        enable = true;
        packages = with pkgs; [
          kdePackages.dolphin
        ];
      };

      terminals = {
        foot.enable = true;
      };

      steam = {
        enable = true;
        scaling = 1.5;
      };

      shells = {
        zsh.enable = true;
      };

      qemu.enable = true;
      niri.enable = true;
      displaymanager.sddm.enable = true;
      nvf.enable = true;
      vesktop.enable = true;
      opentablet.enable = true;
      corectrl.enable = true;
      easyeffects.enable = true;
      btop.enable = true;
      docker.enable = true;
      git.enable = true;
    };
  };
}
