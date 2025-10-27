{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.system.performance;
in {
  config = mkIf cfg.systemd {
    # TODO: Doesn't work. Will figure out later.
    systemd.settings.Manager = {
      DefaultTimeoutStopSec = "10s";
    };
  };
}
