{
  pkgs,
  lib,
  config,
  osConfig,
  ...
}: let
  inherit (lib) mkIf mkMerge;

  nhUsed = config.programs.nh.enable;

  updateString = mkMerge [
    (mkIf nhUsed "nh os switch . -H ${osConfig.networking.hostName}")
    (mkIf (!nhUsed) "sudo nixos-rebuild switch --upgrade --flake ~/Faery#${osConfig.networking.hostName}")
  ];
in {
  config = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      dotDir = "${config.xdg.configHome}/zsh";

      history = {
        share = true;
        extended = true;
        save = 10000;
        size = 10000;
        ignoreAllDups = true;
        expireDuplicatesFirst = true;
        ignoreSpace = true;
      };

      shellAliases = {
        ll = "ls -l";
        update = updateString;
        flake = "nix flake update --flake ~/Faery";
      };

      initContent = lib.mkOrder 500 ''
        source ${config.programs.zsh.dotDir}/plugins/powerlevel10k/powerlevel10k.zsh-theme
        source ~/.p10k.zsh

        if [[ -r "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
      '';

      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.fetchFromGitHub {
            owner = "romkatv";
            repo = "powerlevel10k";
            rev = "v1.20.0";
            sha256 = "sha256-ES5vJXHjAKw/VHjWs8Au/3R+/aotSbY7PWnWAMzCR8E=";
          };
        }
      ];
    };
  };
}
