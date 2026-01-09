{pkgs, ...}: let
  kernelPackage = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
in {
  boot = {
    initrd = {
      kernelModules = [];
      availableKernelModules = ["nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod"];
    };
    kernelPackages = kernelPackage;
    kernelModules = [];
    blacklistedKernelModules = [];
  };
}
