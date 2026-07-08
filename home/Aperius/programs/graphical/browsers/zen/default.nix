{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  cfg = osConfig.faery.programs.browsers.zen;
in {
  config = mkIf cfg.enable {
    programs.zen-browser = {
      enable = true;
      configPath = ".config/zen";

      profiles = {
        default = {
          settings = {
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
            "browser.tabs.allow_transparent_browser" = true;
            "zen.widget.linux.transparency" = true;
            "zen.theme.gradient.show-custom-colors" = true;
            "zen.view.grey-out-inactive-windows" = false;

            "devtools.chrome.enabled" = true;
            "devtools.debugger.remote-enabled" = true;

            # Enables custom stylesheets (css)
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

            # Enables CSD
            "browser.tabs.drawInTitlebar" = true;

            # Fuck you
            "media.webspeech.synth.enabled" = false;
            "media.webspeech.enabled" = false;
            "reader.parse-on-load.enabled" = false;
          };
        };

        secondary = {
          id = 1;
          search = {
            force = true;
            default = "omnisearch";

            engines = {
              omnisearch = {
                name = "omnisearch";
                urls = [
                  {
                    template = "http://localhost:8087/search";
                    params = [
                      {
                        name = "q";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                definedAliases = ["@om"];
              };

              imageSearch = {
                urls = [
                  {
                    template = "https://search.brave.com/images";
                    params = [
                      {
                        name = "q";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                definedAliases = ["@img"];
              };
            };
          };
        };
      };
    };
  };
}
