{
  config,
  lib,
  pkgs,
  ...
}: {
  # Enable autoscrub
  services.btrfs.autoScrub.enable = true;
}
