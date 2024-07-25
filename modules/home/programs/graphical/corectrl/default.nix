{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.faery.programs.corectrl;
in {
  options.faery.programs.corectrl = {
    enable = mkEnableOption "corectrl module.";
  };

  config = mkIf cfg.enable {
    programs.corectrl = {
      enable = true;
      gpuOverclock.enable = true;
    };
  };
}
