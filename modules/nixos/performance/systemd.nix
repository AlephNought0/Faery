{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.system.performance;
in {
  config = mkIf cfg.systemd {
    systemd.settings.Manager = {
      DefaultTimeoutStopSec = "10s";
    };
  };
}
