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
    gnumake42
    gparted
    config.boot.kernelPackages.cpupower
    jdk8

    cmake
    ninja
    just
  ];
}
