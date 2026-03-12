{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.programs.corectrl;
in {
  config = mkIf cfg.enable {
    programs.corectrl.enable = true;
  };
}
