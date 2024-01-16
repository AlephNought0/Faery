{
  config,
  lib,
  pkgs,
  ...
}: {

  boot = {
    initrd.availableKernelModules = ["nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod"];
    initrd.kernelModules = ["amdgpu"];
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];

    kernelPackages = pkgs.linuxPackages_zen;
  };

  services.xserver.videoDrivers = ["modesetting"];
}
