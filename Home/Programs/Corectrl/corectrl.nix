{
  config,
  lib,
  pkgs,
  ...
}: {
  home-manager.users.Aperius.home.packages = with pkgs; [
    corectrl
  ];

  programs.corectrl.enable = true;
  programs.corectrl.gpuOverclock.enable = true;
}
