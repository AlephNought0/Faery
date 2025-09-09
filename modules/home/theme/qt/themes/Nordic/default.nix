{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.faery.system) username;

  cfg = config.faery.theme.qt;
  nordic-patched = pkgs.nordic.overrideAttrs {
    postFixup = ''
      cp ${./Nordic-Darker.kvconfig} $out/share/Kvantum/Nordic-Darker/Nordic-Darker.kvconfig
      cp ${./Nordic-bluish.kvconfig} $out/share/Kvantum/Nordic-Darker/Nordic-bluish.kvconfig
      cp ${./Nordic.kvconfig} $out/share/Kvantum/Nordic-Darker/Nordic.kvconfig
    '';
  };

  nordicThemes = builtins.attrNames (
    builtins.readDir "${nordic-patched}/share/Kvantum"
  );

  nordicSymlinks = lib.optionalAttrs (cfg.style == "kvantum") (
    lib.listToAttrs (map (theme: {
        name = "Kvantum/${theme}";
        value = {source = "${nordic-patched}/share/Kvantum/${theme}";};
      })
      nordicThemes)
  );
in {
  home-manager.users.${username} = mkIf cfg.nordic {
    home.packages = [
      nordic-patched
    ];

    xdg.configFile = nordicSymlinks;
  };
}
