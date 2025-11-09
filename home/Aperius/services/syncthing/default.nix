{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.services.syncthing;
in {
  config = mkIf cfg.enable {
    services.syncthing = {
      enable = true;

      settings = {
        devices = {
          "phone" = {id = "TJJF5TL-D66DP43-ZBWYYK2-R7WYOBU-HL3DN3I-IZF7FOM-VHGHI6T-HZFBPAB";}; # Doxxed fr
        };

        folders = {
          "Keepass" = {
            path = "/home/Aperius/Keepass";
            devices = ["phone"];
          };
        };
      };
    };
  };
}
