{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    kitty
    rofi-wayland
    swww
    grim
    wl-clipboard
    slurp
    inputs.hyprland.packages."${pkgs.system}".hyprland
    inputs.hyprcursor.packages."${pkgs.system}".hyprcursor
  ];

  programs.hyprland = {
    enable = true;
    portalPackage = inputs.xdg-desktop-portal-hyprland.packages."${pkgs.system}".xdg-desktop-portal-hyprland;
  };
}
