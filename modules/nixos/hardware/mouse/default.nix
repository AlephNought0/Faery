{ config, lib, ... }:
let
    inherit (lib) mkEnableOption mkIf;

    cfg = config.faery.system.hardware.logitech;
in
{
    options.faery.system.hardware.logitech = {
        enable = mkEnableOption "logitech mouse module";
    };

    config = mkIf cfg.enable {
       hardware.logitech.wireless = {
            enable = true;
            enableGraphical = true;
       };
    };
}
