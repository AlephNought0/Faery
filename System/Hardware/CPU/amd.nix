{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware.cpu.amd.updateMicrocode = true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
