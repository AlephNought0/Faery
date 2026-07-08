{
  pkgs,
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.programs.wms.niri;
in {
  config = mkIf cfg.enable {
    xdg = {
      portal = {
        enable = true;
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
    };

    home.packages = with pkgs; [
      rofi
      awww
      xwayland-satellite
      wl-screenrec
      wl-gammarelay-rs
      wl-clipboard
    ];
  };
}
