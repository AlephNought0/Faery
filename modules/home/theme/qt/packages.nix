{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.faery.system) username;

  cfg = config.faery.theme.qt;
in {
  home-manager.users.${username}.home.packages =
    [
      (mkIf (cfg.style == "kvantum") pkgs.kdePackages.qtstyleplugin-kvantum)
      pkgs.kdePackages.qt6ct
    ]
    ++ cfg.packages;
}
