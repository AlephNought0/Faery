{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.faery.system) username;

  cfg = config.faery.programs.btop;
in {
  options.faery.programs.btop = {
    enable = mkEnableOption "btop module.";
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      programs.btop = {
        enable = true;

        settings = {
          color_theme = "Default";
          theme_background = false;
          base_10_sizes = true;
        };
      };
    };
  };
}
