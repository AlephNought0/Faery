{ config, lib, pkgs, ... }:
let
    inherit (lib) mkOption mkEnableOption mkIf concatLists;
    inherit (lib.types) package listOf;
    inherit (config.faery.system) username;

    cfg = config.faery.programs.kdeWithoutPlasma;
in
{
    options.faery.programs.kdeWithoutPlasma = {
        enable = mkEnableOption "usage of KDE apps without Plasma environment.";

        packages = mkOption {
            type = listOf package;
            description = "KDE packages you want to install";
            default = [];
        };
    };

    config = mkIf cfg.enable {
        home-manager.users.${username}.home.packages = concatLists [ ## Will add more packages if I find out there are some apps that do not work.
            (with pkgs; [
                kdePackages.qtwayland
                kdePackages.qtsvg
                kdePackages.kiconthemes
            ])
            cfg.packages
        ];

        services.udisks2.enable = true;
    };
}
