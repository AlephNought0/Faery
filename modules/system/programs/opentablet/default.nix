{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.programs.opentablet;
in {
  config = mkIf cfg.enable {
    hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
      package = pkgs.opentabletdriver;
    };
  };
}
