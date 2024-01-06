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
    inputs.wayland.packages."${pkgs.system}".swww
    inputs.wayland.packages."${pkgs.system}".grim
    inputs.wayland.packages."${pkgs.system}".wl-clipboard
    inputs.wayland.packages."${pkgs.system}".slurp
    inputs.hyprland.packages."${pkgs.system}".hyprland
    inputs.ags.packages."${pkgs.system}".default
  ];
}
