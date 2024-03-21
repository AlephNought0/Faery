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
    inputs.wayland.packages."${pkgs.system}".grim
    inputs.wayland.packages."${pkgs.system}".wl-clipboard
    inputs.wayland.packages."${pkgs.system}".slurp
    inputs.hyprland.packages."${pkgs.system}".hyprland
    inputs.hyprcursor.packages."${pkgs.system}".hyprcursor
  ];
}
