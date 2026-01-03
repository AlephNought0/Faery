{pkgs, ...}: {
  services.udev.packages = with pkgs; [oversteer];
}
