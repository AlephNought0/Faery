{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      inputs.xdg-desktop-portal-hyprland.packages."${pkgs.system}".xdg-desktop-portal-hyprland
    ];

    configPackages = [
      pkgs.ssm-session-manager-plugin
    ];
  };
}
