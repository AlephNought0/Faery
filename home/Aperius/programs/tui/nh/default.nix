{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  cfg = osConfig.faery.programs.tui.nh;
in {
  config = mkIf cfg.enable {
    programs.nh = {
      enable = true;
      osFlake = "/home/Aperius/Faery";
    };

    home.sessionVariables = {
      NH_NOM = "true";
    };
  };
}
