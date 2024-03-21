{
  config,
  lib,
  pkgs,
  inputs,
  osConfig,
  ...
}: {
  # Packages
  home-manager.users.Aperius.home.packages = with pkgs; [
    steam
    gamescope
  ];

  # Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override ({extraPkgs ? pkgs': [], ...}: {
        extraPkgs = pkgs':
          (extraPkgs pkgs')
          ++ (with pkgs'; [
            # Add missing dependencies
            libgdiplus
            mangohud
          ]);
      });
    })
  ];
}
