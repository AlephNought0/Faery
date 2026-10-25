{
  lib,
  config,
  inputs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.faery.overlays.cachyos-kernel;
in {
  options.faery.overlays.cachyos-kernel = mkEnableOption "overlay that adds cachyos kernels.";

  config = mkIf cfg {
    nixpkgs.overlays = [
      inputs.nix-cachyos-kernel.overlays.pinned
    ];

    nix.settings = {
      substituters = ["https://cache.lantian.pub/lantian"];
      trusted-public-keys = ["lantian:WVGO7vsRMSEN+h7Lp7kv6SAmrkEXgUGbbXm7jMDjBuQ="];
    };
  };
}
