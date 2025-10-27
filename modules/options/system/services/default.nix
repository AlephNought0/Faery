{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.faery.services = {
    syncthing.enable = mkEnableOption "syncthing service.";
    flatpak.enable = mkEnableOption "flatpak service.";
    polkit.enable = mkEnableOption "polkit service.";
  };
}
