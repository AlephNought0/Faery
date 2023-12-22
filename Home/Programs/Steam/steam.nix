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
    mangohud
    inputs.nix-gaming.packages."${pkgs.system}".proton-ge
  ];

  # Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server

    extraCompatPackages = [
      inputs.nix-gaming.packages."${pkgs.system}".proton-ge
    ];
  };

  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override ({extraPkgs ? pkgs': [], ...}: {
        extraProfile = "export STEAM_EXTRA_COMPAT_TOOLS_PATHS='${inputs.nix-gaming.packages.${pkgs.system}.proton-ge}'";
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
