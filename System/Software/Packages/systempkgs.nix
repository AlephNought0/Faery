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
    qt5.full
    cmake
    gnumake42
    pulseaudio
  ];
}
