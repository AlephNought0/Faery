{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.faery.system) username;

  cfg = config.faery.theme.qt;
in {
  home-manager.users.${username}.xdg.configFile = mkIf (cfg.style
    == "kvantum") {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=${cfg.appTheme}
    '';

    "kdeglobals".text = ''
      [Icons]
      Theme=${cfg.iconTheme}

      [UiSettings]
      ColorScheme=qt6ct
    '';
  };
}
