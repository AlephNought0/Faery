{
  config,
  lib,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "Cirno";

  system.stateVersion = "24.05";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
