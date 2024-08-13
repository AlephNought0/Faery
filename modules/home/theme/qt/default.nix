{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkOption mkEnableOption concatLists mkIf;
  inherit (lib.types) str enum;
  inherit (config.faery.system) username;

  cfg = config.faery.theme.qt;
in {
  options.faery.theme.qt = {
    enable = mkEnableOption "qt module.";
    customPalette = mkEnableOption "usage of custom palette.";

    standardDialogs = mkOption {
      type = enum ["default" "gtk3" "kde" "xdgdesktopportal"];
      default = "default";
      description = "Standard dialogs.";
    };

    platformTheme = mkOption {
      type = str;
      default = "qt5ct";
      description = "Platform theme for qt.";
    };

    style = mkOption {
      type = str;
      default = "breeze";
      description = "Style for qt.";
    };

    iconTheme = mkOption {
      type = str;
      description = "An icon theme for folders in file managers.";
    };

    colorScheme = mkOption {
      type = str;
      default = "simple";
      description = "A color scheme for qt5 applications.";
    };
  };

  config = mkIf cfg.enable {
    qt = {
      enable = true;
      inherit (cfg) platformTheme;
      inherit (cfg) style;
    };

    home-manager.users.${username} = {
      home.packages = with pkgs; [
        tela-icon-theme
        libsForQt5.qtstyleplugin-kvantum
        kdePackages.qt6ct
      ];

      xdg.configFile = {
        "Kvantum/kvantum.kvconfig".text = mkIf (cfg.style == "kvantum") ''
          [General]
          theme=LayanDark
        '';

        "Kvantum/LayanDark".source = mkIf (cfg.style == "kvantum") "${pkgs.layan-kde}/share/Kvantum/Layan";
      };
    };

    nixpkgs.overlays = [
      (self: super: {
        layan-kde = super.layan-kde.overrideAttrs (old: {
          patches = concatLists [
            (old.patches or [])
            [./layan.patch]
          ];
        });
      })
    ];
  };
}
