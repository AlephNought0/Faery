{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.programs.equibop;
in {
  config = mkIf cfg.enable {
    programs.equibop = {
      enable = true;
      equicord.themes = "./Hehe.css";
    };
  };
}
