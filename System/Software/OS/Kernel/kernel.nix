{
  config,
  lib,
  pkgs,
  ...
}: {
  boot.extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];

  boot.kernelModules = [
    "v4l2loopback"
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.initrd.kernelModules = ["amdgpu"];
  services.xserver.videoDrivers = ["modesetting"];
}
