{inputs, ...}: let
  inherit (inputs) self;
  inherit (self) lib;

  nur = inputs.nur.modules.nixos.default;
  nvf = inputs.nvf.nixosModules.default;
  chaotic = inputs.chaotic.nixosModules.default;
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
      chaotic
      pwLowLatency

      {nixpkgs.hostPlatform = "x86_64-linux";}
    ];
  };
}
