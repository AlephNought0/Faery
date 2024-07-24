{ config, lib, ... }:
let
    inherit (lib) mkOption mkMerge mkIf;
    inherit (lib.types) enum;

    cfg = config.faery.system.hardware.cpu;
in
{
    options.faery.system.hardware.cpu = {
        type = mkOption {
            type = enum [ "amd" "intel" ];
            description = "Which type of CPU you use.";
        };
    };

    config = mkMerge [
        (mkIf (cfg.type == "amd") {
            hardware.cpu.amd = {
                updateMicrocode = true;
            };
        })

        (mkIf (cfg.type == "intel") {
            hardware.cpu.intel = {
                updateMicrocode = true;
            };

            services.throttled.enable = true;
        })
    ];
}
