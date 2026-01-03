{
  osConfig,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  cfg = osConfig.faery.programs.browsers.floorp;
in {
  programs.floorp = mkIf cfg.enable {
    enable = true;

    profiles = {
      "faery" = {
        id = 0;
        isDefault = true;

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          #ublock-origin
          adnauseam # Let's troll them
          darkreader
          keepassxc-browser
          return-youtube-dislikes
          translate-web-pages
          user-agent-string-switcher
          simple-tab-groups
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

          # Enables custom stylesheets (css)
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

          # Enables CSD
          "browser.tabs.drawInTitlebar" = true;
        };
      };
    };
  };
}
