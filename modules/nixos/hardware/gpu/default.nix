{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (lib) mkOption mkMerge mkIf;
  inherit (lib.types) enum;

  cfg = config.faery.system.hardware.gpu;
in {
  options.faery.system.hardware.gpu = {
    type = mkOption {
      type = enum ["amd" "nvidia"]; # Will later add intel
      description = "Which type of GPU you use.";
    };
  };

  config = mkMerge [
    (mkIf (cfg.type == "amd") {
      hardware.amdgpu.opencl.enable = true;
      services.xserver.videoDrivers = ["modesetting"];

      boot = {
        initrd.kernelModules = ["amdgpu"];
        kernelModules = ["kvm-amd"];
      };

      chaotic.mesa-git = {
        enable = true;
      };

      # Vulkan and opengl stuff
      hardware = {
        amdgpu.overdrive.enable = true;
        graphics = {
          enable = true;
          enable32Bit = true;

          extraPackages = with pkgs; [
            vaapiVdpau
            libvdpau-va-gl
            inputs.chaotic.packages."${pkgs.system}".libdrm_git
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
    })

    (mkIf (cfg.type == "nvidia") {
      services.xserver.videoDrivers = ["nvidia"];

      hardware = {
        nvidia = {
          modesetting.enable = true;
          powerManagement.enable = false;
          powerManagement.finegrained = false;
          open = false;
          nvidiaSettings = true;
          package = config.boot.linuxKernel.packages.linux_zen.nvidia_x11_vulkan_beta;
        };

        graphics = {
          enable = true;
          enable32Bit = true;
        };
      };
    })
  ];
}
