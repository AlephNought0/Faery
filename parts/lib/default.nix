{inputs, ...}: let
  inherit (inputs.nixpkgs) lib;
  kernel = import ./kernel.nix {};
  builders = import ./builders.nix {
    inherit lib inputs;
    inherit (inputs) self;
    rootDir = ../..;
  };
  extendedLib = lib.extend (final: prev: {
    inherit (kernel) customKernelPackages;
    inherit (builders) mkSystem mkMacSystem;
  });
in {
  perSystem = {
    _module.args.lib = extendedLib;
  };
  flake = {
    lib = extendedLib;
  };
}
