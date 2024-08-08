{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf mkForce;
  inherit (config.faery.system) username;
  cfg = config.faery.programs.browsers.firefox;
in {
  options.faery.programs.browsers.firefox = {
    enable = mkEnableOption "firefox module.";
    dGPU = mkEnableOption "dGPU usage.";
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      xdg.desktopEntries."firefox-nightly" = mkIf cfg.dGPU (mkForce {
        name = "Firefox Nightly";
        type = "Application";
        icon = "firefox-nightly";
        exec = "env DRI_PRIME=1 firefox-nightly %U";
      });
    };

    programs.firefox = {
      enable = true;
      package = inputs.chaotic.packages."${pkgs.system}".firefox_nightly;

      preferences = {
        "media.ffmpeg.vaapi.enabled" = true;
        "gfx.webrender.all" = true;
      };
    };
  };
}
