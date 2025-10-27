{
  lib,
  osConfig,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.theme.qt;
in {
  imports = [
    ./themes
    ./qt6ct
    ./kvantum.nix
  ];

  qt = mkIf cfg.enable {
    enable = true;
    style.name = cfg.style;
    platformTheme.name = cfg.platformTheme;
  };
}
