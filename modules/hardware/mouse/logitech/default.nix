{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.hardware.mouse.logitech-wireless;
in {
  config = mkIf cfg.enable {
    hardware.logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };
  };
}
