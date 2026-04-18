{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  cfg = osConfig.faery.programs.browsers.zen;
in {
  config = mkIf cfg.enable {
    programs.zen-browser = {
      enable = true;
    };
  };
}
