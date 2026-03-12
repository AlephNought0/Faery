{
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs.self) lib;

  kernelPackage = pkgs.cachyosKernels.linuxPackages-cachyos-latest-zen4;
in {
  boot = {
    initrd = {
      kernelModules = [];
      availableKernelModules = ["nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod"];
    };
    kernelPackages = kernelPackage;
    kernelModules = ["v4l2loopback"];
    kernelParams = ["amdgpu.runpm=0"];
    blacklistedKernelModules = ["hid-thrustmaster"];
    extraModulePackages = lib.customKernelPackages kernelPackage ["hid-tmff2" "v4l2loopback"];
    extraModprobeConfig = ''
        options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
  };
}
