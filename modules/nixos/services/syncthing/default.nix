{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.faery.system) username;

  cfg = config.faery.system.services.syncthing;
in {
  options.faery.system.services.syncthing = {
    enable = mkEnableOption "syncthing service.";
  };

  config = mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = "${username}";
      dataDir = "/home/${username}/Documents";
      configDir = "/home/${username}/Documents/.config/syncthing";

      settings = {
        devices = {
          "phone" = {id = "TJJF5TL-D66DP43-ZBWYYK2-R7WYOBU-HL3DN3I-IZF7FOM-VHGHI6T-HZFBPAB";}; # Doxxed fr
        };

        folders = {
          "Keepass" = {
            path = "/home/${username}/Keepass";
            devices = ["phone"];
          };
        };
      };
    };
  };
}
