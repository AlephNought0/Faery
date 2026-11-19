{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.hardware;

  extraPkgs = [
    pkgs.libva-vdpau-driver
    pkgs.libvdpau-va-gl
    pkgs.libva
    pkgs.rocmPackages.clr
    pkgs.rocmPackages.clr.icd
    pkgs.rocmPackages.rocminfo
    pkgs.rocmPackages.rocm-runtime
  ];

  extraPkgs32 = [
    pkgs.driversi686Linux.libvdpau-va-gl
  ];
in {
  config = mkIf (cfg.gpu
    == "amd") {
    services.xserver.videoDrivers = ["modesetting"];

    boot = {
      initrd.kernelModules = ["amdgpu"];
      kernelModules = ["kvm-amd"];
    };

    chaotic.mesa-git = (mkIf cfg.mesa-git) {
      enable = true;
      extraPackages = extraPkgs;
      extraPackages32 = extraPkgs32;
    };

    # Vulkan and opengl stuff
    hardware = {
      amdgpu = {
        overdrive.enable = true;
        opencl.enable = true;
      };

      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = extraPkgs;
        extraPackages32 = extraPkgs32;
      };
    };

    environment.variables = {
      VDPAU_DRIVER = "radeonsi";
      LIBVA_DRIVER_NAME = "radeonsi";
      AMD_VULKAN_ICD = "RADV";
      OCL_ICD_VENDORS = "${pkgs.rocmPackages.clr.icd}/etc/OpenCL/vendors";
      VK_ICD_FILENAMES = "${config.hardware.graphics.package}/share/vulkan/icd.d/radeon_icd.x86_64.json:${config.hardware.graphics.package32}/share/vulkan/icd.d/radeon_icd.i686.json";
      LIBVA_DRM_DEVICE = "/dev/dri/renderD128";
    };

    systemd.tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
  };
}
