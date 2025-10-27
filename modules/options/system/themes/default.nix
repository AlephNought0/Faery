{lib, ...}: let
  inherit (lib) mkEnableOption mkOption;
  inherit (lib.types) enum str;
in {
  options.faery.theme.qt = {
    enable = mkEnableOption "qt module.";
    customPalette = mkEnableOption "usage of custom palette.";
    nordic = mkEnableOption "patched nordic theme.";

    standardDialogs = mkOption {
      type = enum ["default" "gtk3" "kde" "xdgdesktopportal"];
      default = "default";
      description = "Standard dialogs.";
    };

    style = mkOption {
      type = str;
      default = "breeze";
      description = "Style for qt.";
    };

    platformTheme = mkOption {
      type = str;
      default = "qt5ct";
      description = "Platform theme for qt applications.";
    };

    appTheme = mkOption {
      type = str;
      description = "Theme that qt6 applications will use.";
    };

    iconTheme = mkOption {
      type = str;
      description = "An icon theme for qt6 applications.";
    };

    colorScheme = mkOption {
      type = enum ["default" "style-colors" "airy" "darker" "dusk" "ia_ora" "sand" "simple" "waves"];
      default = "default";
      description = "A color scheme for qt6 applications.";
    };
  };
}
