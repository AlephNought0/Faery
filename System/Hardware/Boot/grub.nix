{
  config,
  lib,
  pkgs,
  ...
}: {
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.enable = true;
}
