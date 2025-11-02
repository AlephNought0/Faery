{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.programs.mullvad;
in {
  # Is there even a point in home-manager module if it doesn't work
  # without the system service.
  config = mkIf cfg.enable {
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };
}
