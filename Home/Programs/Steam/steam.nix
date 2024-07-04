{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  # Packages
  home-manager.users.Aperius.home.packages = with pkgs; [
    gamescope
    mangohud
  ];

  # Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server

    package = pkgs.steam.override {
      extraPkgs = pkgs: [ pkgs.libgdiplus ];
    };

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
