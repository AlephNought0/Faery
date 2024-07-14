{
    description = "The most bleeding edge NixOS flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland = {
            url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        xdg-desktop-portal-hyprland = {
            url = "github:hyprwm/xdg-desktop-portal-hyprland";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprcursor = {
            url = "github:hyprwm/hyprcursor";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        quickshell = {
            url = "github:outfoxxed/quickshell";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        prismlauncher = {
            url = "github:prismlauncher/prismlauncher";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nix-gaming = {
            url = "github:fufexan/nix-gaming";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        swww = {
            url = "github:LGFae/swww";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    inherit (nixpkgs) lib;

    nixosConfigurations = import ./systems { inherit inputs; };
  };
}
