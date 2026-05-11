{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  cfg = config.faery.services.omnisearch;
in {
  config = mkIf cfg.enable {
    services.omnisearch.enable = true;
  };
}
