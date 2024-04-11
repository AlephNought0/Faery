{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    pipewire
    btrfs-progs
    networkmanagerapplet
    gcc
    gdb
    mono
    msbuild
    easyeffects
    cmake
    gnumake42
    qt6.full
    gparted
    config.boot.kernelPackages.cpupower
    jdk8
  ];
}
