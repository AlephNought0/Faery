{
  lib,
  inputs,
  self,
  rootDir,
}: let
  mkSystem = name: {
    stateVersion,
    hostPlatform,
    modules ? [],
  }:
    lib.nixosSystem {
      specialArgs = {
        inherit lib inputs self;
      };
      modules =
        [
          (rootDir + "/hosts/${lib.toLower name}")
          (rootDir + "/modules")
          {
            nixpkgs.hostPlatform = hostPlatform;
            system.stateVersion = stateVersion;
            networking.hostName = name;
          }
        ]
        ++ modules;
    };
  mkMacSystem = name: {
    stateVersion,
    modules ? [],
  }:
    lib.nixosSystem {
      specialArgs = {
        inherit lib inputs self;
      };
      modules =
        [
          (rootDir + "/hosts/${lib.toLower name}")
          (rootDir + "/modules")
          (rootDir + "/modules/mac")
          inputs.nixos-apple-silicon.nixosModules.apple-silicon-support
          {
            nixpkgs.hostPlatform = "aarch64-linux";
            system.stateVersion = stateVersion;
            networking.hostName = name;
          }
        ]
        ++ modules;
    };
in {
  inherit mkSystem mkMacSystem;
}
