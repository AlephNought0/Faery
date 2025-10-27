{
  osConfig,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf mkForce;
  inherit (osConfig.faery.xdg) default_terminal;
  cfg = osConfig.faery.programs.tui.nvf;

  nvimScript = pkgs.writeShellScript "nvimServer.sh" ''
    #!/usr/bin/env bash

    SOCKET_PATH="/tmp/nvimsocket"

    if nvim --server $SOCKET_PATH --remote-expr "1" > /dev/null 2>&1; then
        nvim --server $SOCKET_PATH --remote "$1"
    else
        ${default_terminal} nvim --listen $SOCKET_PATH "$1"
    fi
  '';
in {
  config = mkIf cfg.enable {
    xdg.desktopEntries."nvim" = mkForce {
      name = "Neovim";
      type = "Application";
      icon = "nvim";
      exec = "${nvimScript}";
      terminal = false;
      mimeType = ["text/plain"];
    };
  };
}
