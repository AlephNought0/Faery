{
  description = "Main build file";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    prismlauncher.url = "github:prismlauncher/prismlauncher";

    wayland.url = "github:nix-community/nixpkgs-wayland";

    hyprland.url = "github:hyprwm/hyprland";

    xdg-desktop-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";

    nix-gaming.url = "github:fufexan/nix-gaming";

    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      Cirno = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}
