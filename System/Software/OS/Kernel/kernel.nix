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
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };

  security.polkit.enable = true;
  services.xserver.videoDrivers = ["modesetting"];
}
