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

      # I genuinely have no idea how any random ColorScheme besides qt6ct fixes the current issue of improper colors while qt6ct is still being used.
    "kdeglobals".text = ''
      [Icons]
      Theme=${cfg.iconTheme}

      [UiSettings]
      ColorScheme=BreezeDark
    '';
  };
}
