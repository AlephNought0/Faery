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
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];

      config = {
        common = {
          default = ["gnome" "gtk"];
        };
      };
    };

    # Can ANYTHING from GNOME work properly without tinkering?
    systemd.user.services.xdg-desktop-portal-gnome = {
      serviceConfig.Environment = [
        "GDK_BACKEND=wayland"
      ];
    };
  };
}
