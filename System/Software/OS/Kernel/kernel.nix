{
  config,
  lib,
  pkgs,
  ...
}: {
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.initrd.kernelModules = ["amdgpu"];
  services.xserver.videoDrivers = ["modesetting"];
}
