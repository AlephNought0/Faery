{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.programs.wms.hyprland;
in {
  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      portalPackage = inputs.hyprland.packages."${pkgs.system}".xdg-desktop-portal-hyprland;
    };
  };
}
