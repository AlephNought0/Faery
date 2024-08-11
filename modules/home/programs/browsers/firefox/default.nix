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
    nixpkgs.overlays = [inputs.nur.overlay];

    home-manager.users.${username} = {
      xdg.desktopEntries."firefox-nightly" = mkIf cfg.dGPU (mkForce {
        name = "Firefox Nightly";
        type = "Application";
        icon = "firefox-nightly";
        exec = "env DRI_PRIME=1 firefox-nightly %U";
      });

      programs.firefox = {
        enable = true;
        package = inputs.chaotic.packages."${pkgs.system}".firefox_nightly;

        profiles = {
          "faery" = {
            id = 0;
            isDefault = true;

            extensions = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
              darkreader
              keepassxc-browser
              return-youtube-dislikes
              translate-web-pages
              enhancer-for-youtube
              user-agent-string-switcher
            ];

            settings = {
              "media.ffmpeg.vaapi.enabled" = true;
              "gfx.webrender.all" = true;

              "geo.provider.network.url" = "";
              "geo.provider.network.logging.enabled" = false;
              "geo.provider.ms-windows-location" = false;
              "geo.provider.use_corelocation" = false;
              "geo.provider.use_gpsd" = false;
              "geo.provider.use_geoclue" = false;
              "toolkit.telemetry.unified" = false;
              "toolkit.telemetry.enabled" = false;
              "toolkit.telemetry.server" = "data:,";
              "toolkit.telemetry.archive.enabled" = false;
              "toolkit.telemetry.newProfilePing.enabled" = false;
              "toolkit.telemetry.shutdownPingSender.enabled" = false;
              "toolkit.telemetry.updatePing.enabled" = false;
              "toolkit.telemetry.bhrPing.enabled" = false;
              "toolkit.telemetry.firstShutdownPing.enabled" = false;
              "toolkit.telemetry.coverage.opt-out" = true;
              "toolkit.coverage.endpoint.base" = "";
              "browser.ping-centre.telemetry" = false;
              "browser.newtabpage.activity-stream.feeds.telemetry" = false;
              "browser.newtabpage.activity-stream.telemetry" = false;

              "browser.toolbars.bookmarks.visibility" = true;

              "browser.theme.content-theme" = 0;
            };
          };
        };
      };
    };
  };
}
