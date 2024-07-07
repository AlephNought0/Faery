{ config, lib, ... }:
let
    inherit (lib) mkOption mkEnableOption mkIf;
    inherit (lib.types) listOf str;

    cfg = config.faery.system.services.zerotier;
in
{
    options.faery.system.services.zerotier = {
        enable = mkEnableOption "Enable zerotier service.";

        networks = mkOption {
            type = listOf str;
            description = "Zerotier networks";
            default = [ "" ];
        };
    };

    config = mkIf cfg.enable {
        services.zerotierone = {
            enable = true;
            joinNetworks = cfg.networks;
        };
    };
}
