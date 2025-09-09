{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.system.performance;
in {
  config = mkIf cfg.cpu_sched {
    services.scx = {
      enable = true;
      package = pkgs.scx_git.full;
      scheduler = "scx_rustland";
    };
  };
}
