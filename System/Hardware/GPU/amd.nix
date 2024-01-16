{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.variables.AMD_VULKAN_ICD = "RADV";

  # Vulkan and opengl stuff
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      mesa
      amdvlk
      libdrm
      libva
      blender-hip
      vaapiVdpau
      libvdpau-va-gl
      rocmPackages.clr
      rocmPackages.clr.icd
    ];

    extraPackages32 = with pkgs; [
      driversi686Linux.mesa
      driversi686Linux.amdvlk
      driversi686Linux.vaapiVdpau
      driversi686Linux.libvdpau-va-gl
    ];
  };
}
