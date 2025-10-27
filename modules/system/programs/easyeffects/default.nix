{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.programs.easyeffects;
in {
  config = mkIf cfg.enable {
    # For now I see no reason to use dconf anywhere else so I won't make a dedicated file and option for it.
    programs.dconf.enable = true;
  };
}
