{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.system.performance;
in {
  config = mkIf cfg.io_sched {
    services.udev.extraRules = ''
      ACTION=="add|change", KERNEL=="nvme[0-9]n[0-9]", ATTR{queue/scheduler}="bfq"
    '';
  };
}
