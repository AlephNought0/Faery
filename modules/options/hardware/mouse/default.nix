{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.faery.hardware.mouse.logitech-wireless = {
    enable = mkEnableOption "logitech wireless mouse functionality.";
  };
}
