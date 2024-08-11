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
        battery.enable = true;
        logitech.enable = true;
      };

      services = {
        zerotier = {
          enable = true;
          networks = [
            "e3918db4835d47eb"
          ];
        };

        ssh.enable = true;
        polkit.enable = true;
        pipewire.enable = true;
        asusd.enable = true;
      };

      displaymanager.sddm.enable = true;
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

      kdeWithoutPlasma = {
        enable = true;
        packages = with pkgs; [
          libsForQt5.dolphin
        ];
      };

      terminals = {
        foot.enable = true;
      };

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
