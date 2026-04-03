{
  self,
  config,
  lib,
  inputs,
  ...
}: let
  inherit (self) inputs;
  inherit (lib.modules) mkIf mkForce;

  cfg = config.faery.user.useHomeManager;
  specialArgs = {inherit inputs self;};
in {
  home-manager = mkIf cfg {
    verbose = true;
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = specialArgs;

    users = {
      Aperius = {
        imports = [
          ./Aperius/default.nix
        ];
      };
    };

    sharedModules = [
      inputs.mangowm.hmModules.mango
      {
        nix.package = mkForce config.nix.package;
        programs.home-manager.enable = true;

        manual = {
          manpages.enable = false;
          html.enable = false;
          json.enable = false;
        };
      }
    ];
  };
}
