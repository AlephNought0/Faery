{
  lib,
  osConfig,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.programs.mullvad;
in {
  config = mkIf cfg.enable {
    programs.mullvad-vpn.enable = true;
  };
}
