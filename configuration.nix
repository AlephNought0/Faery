{
  config,
  lib,
  pkgs,
  inputs,
  options,
  ...
}: {
  imports = [
    ./System
    ./Home
    inputs.nix-gaming.nixosModules.steamCompat
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];

  nixpkgs.config.permittedInsecurePackages = [
                "electron-25.9.0"
              ];
}
