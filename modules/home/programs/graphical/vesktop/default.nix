{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.faery.system) username;

  cfg = config.faery.programs.vesktop;
  themeFile = ./Hehe.css;
  themeContent = builtins.readFile themeFile;
in {
  options.faery.programs.vesktop = {
    enable = mkEnableOption "vesktop module.";
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      home.packages = with pkgs; [
        vesktop
      ];

      xdg = {
        configFile = {
          "vesktop/themes/Hehe.css".text = themeContent;
          "vesktop/themes/Hehe.css".source = themeFile;

          "vesktop/settings.json".text = builtins.toJSON {
            minimizeToTray = true;
            discordBranch = "canary";
            firstLaunch = false;
            arRPC = "off";
            splashColor = "rgb(219, 222, 225)";
            splashBackground = "rgba(0, 0, 0, 0)";
            windowBounds = {
              x = 22;
              y = 22;
              width = 1236;
              height = 676;
            };
            transparencyOption = ":3";
            maximized = true;
            minimized = false;
            hardwareAcceleration = true;
          };
        };
      };
    };
  };
}
