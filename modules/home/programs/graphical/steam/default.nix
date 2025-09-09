{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf mkForce;
  inherit (lib.types) float;
  inherit (config.faery.system) username;

  cfg = config.faery.programs.steam;
in {
  options.faery.programs.steam = {
    enable = mkEnableOption "steam module.";
    scaling = mkOption {
      type = float;
      description = "Individual scaling for steam";
      default = 1.0;
    };
  };

  config = mkIf cfg.enable {
    programs.gamescope = {
      enable = true;
      package = inputs.chaotic.packages."${pkgs.system}".gamescope_git;
    };

    #programs.gamescope.capSysNice = true;

    home-manager.users.${username} = mkIf (cfg.scaling != 1.0) {
      xdg.desktopEntries."steam" = mkForce {
        name = "Steam";
        type = "Application";
        icon = "steam";
        exec = "steam -forcedesktopscaling ${toString cfg.scaling}";
        terminal = false;
        mimeType = ["text/plain"];
      };
    };

    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server

      package = pkgs.steam.override {
        extraPkgs = pkgs:
          with pkgs; [
            xorg.libXcursor
            xorg.libXi
            xorg.libXinerama
            xorg.libXScrnSaver
            libgdiplus
            libpng
            libpulseaudio
            libvorbis
            stdenv.cc.cc.lib
            libkrb5
            keyutils
          ];
      };

      extraCompatPackages = [
        inputs.chaotic.packages."${pkgs.system}".proton-ge-custom
      ];
    };
  };
}
