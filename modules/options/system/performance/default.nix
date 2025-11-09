{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.faery.system.performance = {
    cpu_sched = mkEnableOption "usage of cpu scheduler performance module.";
    io_sched = mkEnableOption "usage of io scheduler performance module.";
    kernel = mkEnableOption "tweaks for kernel to improve performance.";
  };
}
