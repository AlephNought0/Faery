{
  lib,
  osConfig,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf;
  inherit (lib.strings) toSentenceCase;
  inherit (config.catppuccin) flavor accent;

  catppuccinKde = pkgs.catppuccin-kde.override {
    flavour = [flavor];
    accents = [accent];
  };
  # "mocha" + "mauve" -> "CatppuccinMochaMauve"
  schemeName = "Catppuccin${toSentenceCase flavor}${toSentenceCase accent}";

  cfg = osConfig.faery.theme;
in {
  qt = mkIf cfg.qt.enable {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "qtct";
  };

  gtk.enable = true;

  catppuccin = mkIf cfg.catppuccin.enable {
    enable = true;
    autoEnable = true;
  };

  home.packages = mkIf cfg.catppuccin.enable [catppuccinKde];

  xdg.configFile."kdeglobals" = mkIf cfg.catppuccin.enable {
    force = true;
    text = ''
      [UiSettings]
      ColorScheme=${schemeName}

      [Icons]
      Theme=Papirus-Dark
    '';
  };
}
