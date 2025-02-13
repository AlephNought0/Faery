{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkOption mkEnableOption mkIf;
  inherit (lib.types) str;
  inherit (config.faery.system) username;
  inherit (config.home-manager.users.${username}.home) homeDirectory;
  cfg = config.faery.xdg;
in {
  options.faery.xdg = {
    enable = mkEnableOption "xdg module.";
    default_browser = mkOption {
      type = str;
      description = "Default browser.";
    };

    default_editor = mkOption {
      type = str;
      description = "Default file editor.";
    };

    default_terminal = mkOption {
      type = str;
      description = "Default terminal.";
    };
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      home = {
        packages = with pkgs; [
          xdg-utils
          shared-mime-info
        ];

        sessionVariables = {
          TERMINAL = cfg.default_terminal;
          EDITOR = cfg.default_editor;
        };
      };

      xdg = {
        enable = true;
        mime.enable = true;

        mimeApps = {
          enable = true;

          defaultApplications = {
            "text/plain" = cfg.default_editor;
            "application/x-zerosize" = cfg.default_editor;
            "text/uri-list" = cfg.default_browser;
            "x-scheme-handler/http" = cfg.default_browser;
            "x-scheme-handler/https" = cfg.default_browser;
            "x-scheme-handler/chrome" = cfg.default_browser;
            "text/html" = cfg.default_browser;
            "application/x-extension-htm" = cfg.default_browser;
            "application/x-extension-html" = cfg.default_browser;
            "application/x-extension-shtml" = cfg.default_browser;
            "application/xhtml+xml" = cfg.default_browser;
            "application/x-extension-xhtml" = cfg.default_browser;
            "application/x-extension-xht" = cfg.default_browser;
            "x-scheme-handler/about" = cfg.default_browser;
            "x-scheme-handler/unknown" = cfg.default_browser;
          };
        };

        userDirs = {
          enable = true;
          createDirectories = true;

          download = "${homeDirectory}/Downloads";
          desktop = "${homeDirectory}/Desktop";
          documents = "${homeDirectory}/Documents";
          music = "${homeDirectory}/Music";
          pictures = "${homeDirectory}/Pictures";
          videos = "${homeDirectory}/Videos";
        };
      };
    };
  };
}
