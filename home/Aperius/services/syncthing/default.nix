{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.services.syncthing;
in {
  config = mkIf cfg.enable {
    services.syncthing = lib.mkDefault {
      enable = true;

      settings = {
        devices = {
          "17promax" = {id = "HINI3YI-TM5RPFW-3477ROZ-BOFBCYR-FWJRPTB-LBRH5WZ-AGBGQ2W-PMRSFQT";};
          "m2pro" = {id = "B7V4Z4F-PSUD64G-UYLJKT6-YFXF7QW-XU3FCGF-ZZHU6VI-EA3XEEW-ZUYIUQX";};
          "computah" = {id = "AMJ37TC-OCW5NB5-UVBXRUQ-ARHHI2X-XIDHNJ6-HJOFLEZ-RUOT4V3-E4V47AF";};
        };

        folders = {
          "Keepass" = {
            path = "/home/Aperius/Keepass";
            devices = ["17promax" "m2pro" "computah"];
          };
        };
      };
    };
  };
}
