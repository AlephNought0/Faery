{inputs, ...}: let
  inherit (inputs) self;
  inherit (self) lib;
in
{
    Cirno = lib.nixosSystem {
        specialArgs = {
            inherit lib inputs self;
        };

        modules = [
            ./cirno
            ../modules
            inputs.home-manager.nixosModules.home-manager
            inputs.nix-gaming.nixosModules.pipewireLowLatency
            inputs.chaotic.nixosModules.default
            inputs.nvf.nixosModules.default

            {nixpkgs.hostPlatform = "x86_64-linux";}
        ];
    };

    Ayumu = lib.nixosSystem {
        specialArgs = {
            inherit lib inputs self;
        };

        modules = [
            ./ayumu
            ../modules
            inputs.home-manager.nixosModules.home-manager
            inputs.nix-gaming.nixosModules.pipewireLowLatency
            inputs.chaotic.nixosModules.default
            inputs.nvf.nixosModules.default

            {nixpkgs.hostPlatform = "x86_64-linux";}
        ];
    };
}
