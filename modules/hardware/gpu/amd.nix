{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.hardware.gpu;
in {
  config = mkIf (cfg
    == "amd") {
    hardware.amdgpu.opencl.enable = true;
    services.xserver.videoDrivers = ["modesetting"];

    boot = {
      initrd.kernelModules = ["amdgpu"];
      kernelModules = ["kvm-amd"];
    };

    chaotic.mesa-git = {
      enable = true;
      extraPackages = with pkgs; [
        # One day I will try to separate nyx packages from normal ones.
        libva-vdpau-driver
        libvdpau-va-gl
        libdrm_git
        libva
        rocmPackages.clr
        rocmPackages.clr.icd
        rocmPackages.rocminfo
        rocmPackages.rocm-runtime
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.libvdpau-va-gl
      ];
    };

    # Vulkan and opengl stuff
    hardware = {
      amdgpu.overdrive.enable = true;
      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };

    environment.variables = {
      VDPAU_DRIVER = "radeonsi";
      LIBVA_DRIVER_NAME = "radeonsi";
      AMD_VULKAN_ICD = "RADV";
      OCL_ICD_VENDORS = "${pkgs.rocmPackages.clr.icd}/etc/OpenCL/vendors";
      VK_ICD_FILENAMES = "${pkgs.mesa_git}/share/vulkan/icd.d/radeon_icd.x86_64.json";
    };

    systemd.tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
  };
}
