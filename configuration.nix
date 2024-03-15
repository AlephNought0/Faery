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
    ../GitHub/github.nix
    inputs.nix-gaming.nixosModules.steamCompat
    #inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];
}
