{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.faery.system.services.asusd;
in {
  options.faery.system.services.asusd = {
    enable = mkEnableOption "asusd service.";
  };

  config = mkIf cfg.enable {
    services.asusd = {
      enable = true;
      enableUserService = true;
    };
  };
}
