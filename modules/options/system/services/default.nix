{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.faery.services = {
    syncthing.enable = mkEnableOption "syncthing service.";
  };
}
