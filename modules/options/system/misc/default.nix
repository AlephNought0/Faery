{lib, ...}: let
  inherit (lib) mkOption mkEnableOption;
  inherit (lib.types) str;
in {
  options.faery = {
    xdg = {
      enable = mkEnableOption "xdg.";

      default_browser = mkOption {
        type = str;
        description = "Default browser.";
      };

      default_editor = mkOption {
        type = str;
        description = "Default file editor.";
      };

      default_terminal = mkOption {
        type = str;
        description = "Default terminal.";
      };
    };

    kdeWithoutPlasma.enable = mkEnableOption "usage of KDE apps without Plasma desktop environment.";
  };
}
