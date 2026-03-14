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
          xdg-desktop-portal-wlr
        ];

        config = {
          common = {
            default = ["kde" "wlr"];
            "org.freedesktop.impl.portal.ScreenCast" = ["wlr"];
            "org.freedesktop.impl.portal.Screenshot" = ["wlr"];
            "org.freedesktop.impl.portal.FileChooser" = ["kde"];
          };
        };
      };
    };

    home.packages = with pkgs; [
      rofi
      swww
      xwayland-satellite
      wl-screenrec
      wl-gammarelay-rs
      wl-clipboard
      xclip
    ];
  };
}
