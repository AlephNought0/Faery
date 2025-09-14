{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.faery.system) username;

  cfg = config.faery.programs.corectrl;
in {
  options.faery.programs.corectrl = {
    enable = mkEnableOption "corectrl module.";
  };

  config = mkIf cfg.enable {
    programs.corectrl.enable = true;
    users.users.${username}.extraGroups = ["corectrl"];
  };
}
