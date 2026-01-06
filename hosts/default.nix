{inputs, ...}: {
  flake.nixosConfigurations = let
    inherit (inputs) self;
    inherit (inputs.self) lib;

    nur = inputs.nur.modules.nixos.default;
    nvf = inputs.nvf.nixosModules.default;
    pwLowLatency = inputs.nix-gaming.nixosModules.pipewireLowLatency;
    hm = inputs.home-manager.nixosModules.home-manager;
  in {
    Cirno = lib.nixosSystem {
      specialArgs = {
        inherit lib inputs self;
      };

      modules = [
        ./cirno
        ../modules
        ../home
        ../overlays

        hm
        nur
        nvf
        pwLowLatency

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
        ../home
        ../overlays

        hm
        nur
        nvf
        pwLowLatency

        {nixpkgs.hostPlatform = "x86_64-linux";}
      ];
    };
  };
}
