{
  config,
  lib,
  pkgs,
  ...
}: {

  boot = {
    initrd.availableKernelModules = ["nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod"];
    initrd.kernelModules = ["amdgpu"];
    kernelModules = ["kvm-amd" "v4l2loopback"];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
    kernelPackages = pkgs.linuxPackages_zen;
  };

  security.polkit.enable = true;
  services.xserver.videoDrivers = ["modesetting"];
}
