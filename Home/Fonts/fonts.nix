{
  config,
  lib,
  pkgs,
  ...
}: {
  fonts.packages = with pkgs; [
    jetbrains-mono
  ];
}
