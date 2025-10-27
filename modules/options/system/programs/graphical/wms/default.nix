{lib, ...}: let
  inherit (lib) mkEnableOption mkOption;
  inherit (lib.types) float;
in {
  options.faery.programs.wms = {
    hyprland = {
      enable = mkEnableOption "hyprland module.";
      enableDebug = mkEnableOption "hyprland debug mode.";

      scaling = mkOption {
        type = float;
        description = "Monitor scaling for hyprland";
        default = 1.0;
      };
    };

    niri.enable = mkEnableOption "niri module.";
  };
}
