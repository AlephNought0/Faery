{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  imports = [
    ./cpu_sched.nix
    ./io_sched.nix
    ./kernel.nix
    ./systemd.nix
  ];

  options.faery.system.performance = {
    cpu_sched = mkEnableOption "usage of cpu scheduler performance module.";
    io_sched = mkEnableOption "usage of io scheduler performance module.";
    kernel = mkEnableOption "tweaks for kernel to improve performance.";
    systemd = mkEnableOption "systemd tweaks to make the system a little bit faster.";
  };
}
