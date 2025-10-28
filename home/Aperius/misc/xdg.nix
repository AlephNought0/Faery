{
  osConfig,
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.xdg;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      xdg-utils
      shared-mime-info
    ];

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

          "x-scheme-handler/roblox-player" = "org.vinegarhq.Sober.desktop";
        };
      };

      userDirs = {
        enable = true;
        createDirectories = true;

        download = "${config.home.homeDirectory}/Downloads";
        desktop = "${config.home.homeDirectory}/Desktop";
        documents = "${config.home.homeDirectory}/Documents";
        music = "${config.home.homeDirectory}/Music";
        pictures = "${config.home.homeDirectory}/Pictures";
        videos = "${config.home.homeDirectory}/Videos";
      };
    };
  };
}
