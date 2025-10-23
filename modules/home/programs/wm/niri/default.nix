{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.faery.system) username;

  cfg = config.faery.programs.niri;
in {
  options.faery.programs.niri = {
    enable = mkEnableOption "niri module.";
  };

  config = mkIf cfg.enable {
    programs.niri.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };

    home-manager.users.${username} = {
      # There must be a better way to do this...
      config,
      pkgs,
      ...
    }: {
      home.packages = with pkgs; [
        kdePackages.xwaylandvideobridge
        rofi
        swww
        wl-clipboard
        xwayland-satellite
        wl-screenrec
      ];

      xdg.configFile = {
        "niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "/home/${username}/Faery/modules/home/programs/wm/niri/config.kdl";
      };
    };
  };
}
