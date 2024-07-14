{ config, lib, inputs, pkgs, ... }:
let
    inherit (lib) mkEnableOption mkIf;

    cfg = config.faery.programs.browsers.firefox;
in
{
    options.faery.programs.browsers.firefox = {
        enable = mkEnableOption "firefox module.";
    };

    config = mkIf cfg.enable {
        programs.firefox = {
            enable = true;
            package = inputs.chaotic.packages."${pkgs.system}".firefox_nightly;

            preferences = {
                "media.ffmpeg.vaapi.enabled" = true;
                "media.ffvpx.enabled" = false;
                "media.av1.enabled" = false;
                "gfx.webrender.all" = true;
                "dom.webgpu.enabled" = true;
                "gfx.webrender.compositor" = true;
                "gfx.webrender.software" = true;
            };
        };
    };
}
