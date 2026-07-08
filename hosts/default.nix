{inputs, ...}: {
  flake.nixosConfigurations = let
    inherit (inputs.self) lib;

    nur = inputs.nur.modules.nixos.default;
    nvf = inputs.nvf.nixosModules.default;
    pwLowLatency = inputs.nix-gaming.nixosModules.pipewireLowLatency;
    hm = inputs.home-manager.nixosModules.home-manager;
  in {
    # My Macbook M2 Pro laptop with 16 inch display. Used as a device for travelling or work outside my home.
    Cirno = lib.mkMacSystem "Cirno" {
      stateVersion = "26.05"; # Only change when installing a new system or reinstalling.
      modules = [
        ../home
        ../overlays

        nvf
        pwLowLatency
        hm
        nur
      ];
    };

    # My self built computer with Ryzen 7 7700X, RX 6800XT and 32GB of DDR5-5600 RAM. I use it as my main workstation and gaming device.
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
