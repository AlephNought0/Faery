{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.xdg;
in {
  config = mkIf cfg.enable {
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
      ];
      configPackages = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
      ];
    };
  };
}
