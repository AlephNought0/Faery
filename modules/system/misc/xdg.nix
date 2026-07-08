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
      wlr.enable = true;
      xdgOpenUsePortal = true;

      extraPortals = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
        xdg-desktop-portal-gnome
      ];

      config = {
        common = {
          default = ["kde" "gnome"];
          "org.freedesktop.impl.portal.ScreenCast" = ["gnome"];
          "org.freedesktop.impl.portal.Screenshot" = ["gnome"];
          "org.freedesktop.impl.portal.FileChooser" = ["kde"];
        };
      };
    };

    systemd.user.services.xdg-desktop-portal-gnome = {
      serviceConfig.Environment = [
        "GDK_BACKEND=wayland"
      ];
    };
  };
}
