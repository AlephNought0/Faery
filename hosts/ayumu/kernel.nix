{pkgs, ...}: {
  boot = {
    initrd = {
      kernelModules = [];
      availableKernelModules = ["nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod"];
    };
    kernelModules = ["hid_tmff2"];
    extraModulePackages = with pkgs.linuxKernel.packages; [linux_xanmod_latest.hid-tmff2];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };
}
