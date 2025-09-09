{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.faery.system) username;

  cfg = config.faery.programs.shells.zsh;
in {
  options.faery.programs.shells.zsh = {
    enable = mkEnableOption "zsh module.";
  };

  config = mkIf cfg.enable {
    environment.shells = with pkgs; [zsh];
    users.defaultUserShell = pkgs.zsh;

    programs.zsh = {
      enable = true;
      enableCompletion = false;
    };

    home-manager.users.${username} = {
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

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
          update = "sudo nixos-rebuild switch --upgrade --flake ~/Faery#Cirno";
          flake = "nix flake update --flake ~/Faery";
        };

        initContent = lib.mkOrder 500 ''
          source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
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
  };
}
