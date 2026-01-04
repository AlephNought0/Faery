{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.programs.quickshell;
in {
  config = mkIf cfg.enable {
    programs.quickshell.enable = true;
  };
}
