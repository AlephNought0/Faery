{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.programs.openrgb;
in {
  config = mkIf cfg.enable {
    services.hardware.openrgb = {
      enable = true;
      motherboard = config.faery.hardware.cpu;
    };
  };
}
