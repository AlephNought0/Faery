{inputs, ...}: let
  inherit (inputs.nixpkgs) lib;

  kernel = import ./kernel.nix {};

  extendedLib = lib.extend (final: prev: {
    inherit (kernel) customKernelPackages;
  });
in {
  perSystem = {pkgs, ...}: {
    _module.args.lib = extendedLib;
  };

  flake = {
    lib = extendedLib;
  };
}
