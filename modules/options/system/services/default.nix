{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.faery.services = {
    syncthing.enable = mkEnableOption "syncthing service.";
    clipman.enable = mkEnableOption "clipman service.";
    dunst.enable = mkEnableOption "dunst service.";
    omnisearch.enable = mkEnableOption "omnisearch service.";
  };
}
