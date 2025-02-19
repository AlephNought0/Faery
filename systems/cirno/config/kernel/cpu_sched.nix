{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.system.performance;
in {
  config = mkIf cfg.cpu_sched {
    services.scx = {
      enable = true;
      scheduler = "scx_lavd";
    };
  };
}
