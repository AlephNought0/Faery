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
