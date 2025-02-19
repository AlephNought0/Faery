{
  config,
  pkgs,
  ...
}: {
  boot = {
    initrd = {
      kernelModules = [];
      availableKernelModules = ["nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod"];
    };
    kernelModules = ["v4l2loopback"];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
    kernelPackages = pkgs.linuxPackages_cachyos;
    kernelParams = [
      #Disable tickless kernel to improve performance
      "nohz=off"

      #Force TSC instead of HPET
      "hpet=disable"
      "clocksource=tsc"
      "tsc=reliable"
    ];
  };

  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
  };
}
