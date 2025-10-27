{pkgs, ...}: {
  boot = {
    initrd = {
      kernelModules = [];
      availableKernelModules = ["nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod"];
    };
    kernelModules = [];
    kernelPackages = pkgs.linuxPackages_cachyos;
  };
}
