{
  pkgs,
  osConfig,
  config,
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

      configFile = {
        "niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "/home/Aperius/Faery/home/Aperius/programs/graphical/wms/niri/config.kdl";
      };
    };

    home.packages = with pkgs; [
      rofi
      swww
      wl-clipboard
      xwayland-satellite
      wl-screenrec
    ];
  };
}
