{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.system.performance;
in {
  config = mkIf cfg.cpu_sched {
    services.scx-loader = {
      enable = true;
      config = {
        default_sched = "scx_rusty";
        default_mode = "LowLatency";
      };
    };
  };
}
