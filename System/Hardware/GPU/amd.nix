{
  config,
  lib,
  pkgs,
  ...
}: {

  hardware.amdgpu.opencl.enable = true;

  # Vulkan and opengl stuff
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
      libdrm
      libva
      rocmPackages.clr
      rocmPackages.clr.icd
      rocmPackages.rocminfo
      rocmPackages.rocm-runtime

    ];

    extraPackages32 = with pkgs; [
      driversi686Linux.mesa
      driversi686Linux.libvdpau-va-gl
    ];
  };

  environment.variables = {
    VDPAU_DRIVER = "radeonsi";
    LIBVA_DRIVER_NAME = "radeonsi";
    AMD_VULKAN_ICD = "RADV";
  };

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
}
