{
  config,
  lib,
  osConfig,
  ...
}: {
    imports = [
        ./Packages
        ./Programs
    ];

   home-manager = {
       useGlobalPkgs = true;
       users.Aperius = {
         home.stateVersion = "24.05";
            programs = {
                home-manager.enable = true;
                direnv = {
                    enable = true;
                    nix-direnv.enable = true;
                };
            };
        };
    };
}

