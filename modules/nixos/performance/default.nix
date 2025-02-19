{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  imports = [
    ./cpu_sched.nix
    ./io_sched.nix
    ./kernel.nix
  ];

  options.faery.system.performance = {
    enable = mkEnableOption "performance tweaks";
    cpu_sched = mkEnableOption "usage of lavd scheduler";
    io_sched = mkEnableOption "usage of bfq io scheduler";
    kernel = mkEnableOption "tweaks for kernel to improve performance";
  };
}
