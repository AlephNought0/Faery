{
  inputs,
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

    home-manager.users.${username} = {
      # There must be a better way to do this...
      config,
      pkgs,
      ...
    }: {
      home.packages = with pkgs; [
        kdePackages.xwaylandvideobridge
        rofi-wayland
        inputs.swww.packages."${pkgs.system}".swww
        wl-clipboard
        xwayland-satellite
        xdg-desktop-portal-gtk
      ];

      xdg.configFile = {
        "niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "/home/${username}/Faery/modules/home/programs/wm/niri/config.kdl";
      };
    };
  };
}
