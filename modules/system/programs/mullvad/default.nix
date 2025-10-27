{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.programs.mullvad;
in {
  config = mkIf cfg.enable {
    services.mullvad-vpn.enable = true;
  };
}
