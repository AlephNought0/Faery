{
  config,
  lib,
  pkgs,
  ...
}: {
  # Vulkan and opengl stuff
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      rocmPackages.clr
      rocmPackages.clr.icd
    ];

    extraPackages32 = with pkgs; [
      driversi686Linux.vaapiVdpau
      driversi686Linux.mesa
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
