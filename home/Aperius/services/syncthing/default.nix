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
          "xiaomi" = {id = "TJJF5TL-D66DP43-ZBWYYK2-R7WYOBU-HL3DN3I-IZF7FOM-VHGHI6T-HZFBPAB";}; # Doxxed fr
          "17promax" = {id = "HINI3YI-TM5RPFW-3477ROZ-BOFBCYR-FWJRPTB-LBRH5WZ-AGBGQ2W-PMRSFQT";};
        };

        folders = {
          "Keepass" = {
            path = "/home/Aperius/Keepass";
            devices = ["xiaomi" "17promax"];
          };
        };
      };
    };
  };
}
