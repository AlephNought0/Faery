{ inputs, ... }: 
let
    inherit (inputs) self;
    inherit (self) lib;
in 
{
    Cirno = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
            inherit lib inputs self;
        };

        modules = [
            ./cirno
            ../modules
            inputs.home-manager.nixosModules.home-manager
            inputs.nix-gaming.nixosModules.pipewireLowLatency
        ];
    };

    Ayumu = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
            inherit lib inputs self;
        };

        modules = [
            ./ayumu
            ../modules
            inputs.home-manager.nixosModules.home-manager
            inputs.nix-gaming.nixosModules.pipewireLowLatency
        ];
    };
}
