{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.faery.programs.tui = {
    nvf.enable = mkEnableOption "nvf module.";
    btop.enable = mkEnableOption "btop module.";
    nh.enable = mkEnableOption "nh module.";
  };
}
