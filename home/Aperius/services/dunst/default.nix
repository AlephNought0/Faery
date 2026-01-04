{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  cfg = osConfig.faery.services.dunst;
in {
  config = mkIf cfg.enable {
    services.dunst.enable = true;
  };
}
