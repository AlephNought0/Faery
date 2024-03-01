{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware.cpu.amd.updateMicrocode = true;

  #powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  services.auto-epp = {
    enable = true;
    settings.Settings = {
      epp_state_for_AC = "performance";
      epp_state_for_BAT = "balance_power";
    };
  };
}
