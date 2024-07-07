{ config, lib, pkgs, self, inputs, ... }:
let
    inherit (config.faery.system) username;
    inherit (lib) mkOption mkEnableOption mkIf;
    inherit (lib.types) str;

    cfg = config.faery.home-manager;

    is-linux = pkgs.stdenv.isLinux;
    is-darwin = pkgs.stdenv.isDarwin;

    home-directory =
    if is-darwin
    then "/Users/${username}"
    else "/home/${username}";
in
{
    options.faery.home-manager = {
        enable = mkEnableOption "home manager.";
        enableDirenv = mkEnableOption "direnv.";

        home = mkOption {
            type = str;
            description = "Home directory";
            default = home-directory;
        };
    };

    config = mkIf cfg.enable {
        home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            extraSpecialArgs = { inherit inputs self; };
            users."${username}" = {
                programs = {
                    home-manager.enable = true;
                    direnv = mkIf cfg.enableDirenv {
                        enable = true;
                        nix-direnv.enable = true;
                    };
                };

                home = {
                    homeDirectory = cfg.home;
                    stateVersion = "24.11";
                };
            };
        };
    };
}
