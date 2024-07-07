{ config, lib, ... }:
let
    inherit (lib) mkEnableOption mkIf;

    cfg = config.faery.system.services.pipewire;
in
{
    options.faery.system.services.pipewire = {
        enable = mkEnableOption "pipewire service."; #Forget about using PulseAudio lmfao
    };

    config = mkIf cfg.enable {
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;

            lowLatency = {
                enable = true;
                quantum = 64;
                rate = 48000;
            };
        };

        security.rtkit.enable = true;
    };
}
