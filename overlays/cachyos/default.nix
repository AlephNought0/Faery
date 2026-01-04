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
      substituters = ["https://attic.xuyh0120.win/lantian"];
      trusted-public-keys = ["lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="];
    };
  };
}
