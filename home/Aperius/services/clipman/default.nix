{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  cfg = osConfig.faery.services.clipman;
in {
  config = mkIf cfg.enable {
    services.clipman.enable = true;
  };
}
