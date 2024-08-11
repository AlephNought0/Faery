{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.faery.system) username;

  cfg = config.faery.programs.terminals.foot;
in {
  options.faery.programs.terminals.foot = {
    enable = mkEnableOption "foot module.";
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      programs.foot = {
        enable = true;

        settings = {
          main = {
            font = "JetBrainsMono NerdFont:size=12";
          };

          colors = {
            alpha = 0.6;
          };
        };
      };
    };
  };
}
