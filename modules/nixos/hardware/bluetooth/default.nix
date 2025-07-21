{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.faery.system.hardware.bluetooth;
in {
  options.faery.system.hardware.bluetooth = {
    enable = mkEnableOption "bluetooth.";
  };

  config = mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    services.blueman.enable = true;
  };
}
