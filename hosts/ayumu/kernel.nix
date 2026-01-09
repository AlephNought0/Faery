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
    kernelModules = [];
    blacklistedKernelModules = ["hid-thrustmaster"];
    extraModulePackages = lib.customKernelPackages kernelPackage ["hid-tmff2"];
  };
}
