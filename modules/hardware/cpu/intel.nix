{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.hardware.cpu;
in {
  config = mkIf (cfg
    == "intel") {
    hardware.cpu.intel = {
      updateMicrocode = true;
    };

    services.throttled.enable = true;
    services.upower.enable = true;
    powerManagement.cpuFreqGovernor = "performance";
  };
}
