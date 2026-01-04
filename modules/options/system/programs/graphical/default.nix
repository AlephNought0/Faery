{lib, ...}: let
  inherit (lib) mkEnableOption mkOption;
  inherit (lib.types) float;
in {
  imports = [
    ./wms
    ./browsers
  ];

  options.faery.programs = {
    steam = {
      enable = mkEnableOption "steam module.";
      scaling = mkOption {
        type = float;
        description = "Individual scaling for steam.";
        default = 1.0;
      };
    };

    displayManagers = {
      sddm.enable = mkEnableOption "SDDM module.";
    };

    vesktop.enable = mkEnableOption "vesktop client.";
    opentablet.enable = mkEnableOption "opentablet module.";
    mullvad.enable = mkEnableOption "mullvad module.";
    easyeffects.enable = mkEnableOption "easyeffects module.";
    quickshell.enable = mkEnableOption "quickshell module.";
  };
}
