{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.programs.wms.niri;
in {
  config = mkIf cfg.enable {
    programs.niri.enable = true;
  };
}
