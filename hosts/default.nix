{inputs, ...}: {
  flake.nixosConfigurations = let
    inherit (inputs.self) lib;

    nur = inputs.nur.modules.nixos.default;
    nvf = inputs.nvf.nixosModules.default;
    pwLowLatency = inputs.nix-gaming.nixosModules.pipewireLowLatency;
    hm = inputs.home-manager.nixosModules.home-manager;
  in {
    Cirno = lib.mkMacSystem "Cirno" {
      stateVersion = "26.05"; # Only change when installing a new system or reinstalling.
      modules = [
        ../home

        nvf
        pwLowLatency
        hm
      ];
    };

    Ayumu = lib.mkSystem "Ayumu" {
      stateVersion = "25.05";
      hostPlatform = "x86_64-linux";
      modules = [
        ../home
        ../overlays

        hm
        nur
        nvf
        pwLowLatency
      ];
    };
  };
}
