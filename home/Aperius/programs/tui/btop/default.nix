{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.programs.tui.btop;
in {
  programs.btop = mkIf cfg.enable {
    enable = true;

    settings = {
      color_theme = "Default";
      theme_background = false;
      base_10_sizes = true;
    };
  };
}
