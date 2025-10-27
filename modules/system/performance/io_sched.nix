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
      ACTION=="add|change", KERNEL=="nvme[0-9]n[0-9]", ATTR{queue/scheduler}="none"

      ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/scheduler}="bfq"

      ACTION=="add|change", KERNEL=="vd[a-z]", ATTR{queue/scheduler}="bfq"
    '';
  };
}
