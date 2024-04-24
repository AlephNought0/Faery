{
  config,
  lib,
  pkgs,
  ...
}: {
  #X11
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
}
