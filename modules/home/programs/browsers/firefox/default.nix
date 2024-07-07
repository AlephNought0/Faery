{ config, lib, inputs, pkgs, ... }:
let
    inherit (lib) mkEnableOption mkIf;

    cfg = config.faery.programs.browsers.firefox;
in
{
    options.faery.programs.browsers.firefox = {
        enable = mkEnableOption "Enable corectrl module.";
    };

    config = mkIf cfg.enable {
        programs.firefox = {
            enable = true;
            package = inputs.firefox-nightly.packages."${pkgs.system}".firefox-nightly-bin;

            preferences = {
                "media.ffmpeg.vaapi.enabled" = true;
                "media.ffvpx.enabled" = false;
                "media.av1.enabled" = false;
                "gfx.webrender.all" = true;
                "widget.wayland.fractional-scale.enabled" = true;
            };
        };
    };
}
