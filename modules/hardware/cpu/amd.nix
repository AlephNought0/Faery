{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.hardware.cpu;
in {
  config = mkIf (cfg
    == "amd") {
    hardware.cpu.amd = {
      updateMicrocode = true;
    };

    services.upower.enable = true;
    powerManagement.cpuFreqGovernor = "performance";
  };
}
