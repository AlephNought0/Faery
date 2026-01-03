{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.programs.steam;

  proton-ge-9 = pkgs.proton-ge-bin.overrideAttrs (oldAttrs: rec {
    version = "GE-Proton9-2";

    src = pkgs.fetchzip {
      url = "https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${version}/${version}.tar.gz";
      hash = "sha256-NqBzKonCYH+hNpVZzDhrVf+r2i6EwLG/IFBXjE2mC7s=";
    };

    preFixup = ''
      substituteInPlace "$steamcompattool/compatibilitytool.vdf" \
        --replace-fail "${version}" "${version}"
    '';

    #passthru = oldAttrs.passthru or {};
  });
in {
  config = mkIf cfg.enable {
    programs = {
      gamescope = {
        enable = true;
        #capSysNice = true;
      };

      steam = {
        enable = true;
        gamescopeSession.enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        protontricks.enable = true;

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
          pkgs.proton-ge-bin
          proton-ge-9
        ];
      };
    };
  };
}
