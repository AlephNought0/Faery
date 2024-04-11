{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware.cpu.amd.updateMicrocode = true;

  powerManagement.cpuFreqGovernor = "performance";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

}
