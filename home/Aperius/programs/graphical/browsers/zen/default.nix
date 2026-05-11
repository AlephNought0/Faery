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

      profiles.default = {
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
}
