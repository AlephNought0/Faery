{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.theme.qt;
in {
  config = mkIf (cfg.style == "kvantum") {
    xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=${cfg.appTheme}
      '';

      "kdeglobals".text = ''
        [Icons]
        Theme=${cfg.iconTheme}

        [UiSettings]
        ColorScheme=BreezeDark
      '';
    };
  };
}
