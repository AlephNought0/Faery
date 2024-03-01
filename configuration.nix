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
    #inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];
}
