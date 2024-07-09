{ config, lib, pkgs, inputs, ... }:
let
    inherit (lib) mkEnableOption mkIf;
    inherit (config.faery.system) username;

    cfg = config.faery.programs.steam;
in
{
    options.faery.programs.steam = {
        enable = mkEnableOption "steam module.";
    };

    config = mkIf cfg.enable {
        programs.gamescope = {
            package = inputs.chaotic.packages."${pkgs.system}".gamescope_git;
        };

        home-manager.users.${username}.home.packages = with pkgs; [
            mangohud
        ];

        programs.steam = {
            enable = true;
            gamescopeSession.enable = true;
            remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
            dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server

            package = pkgs.steam.override {
                extraPkgs = pkgs: [ pkgs.libgdiplus ];
            };

            extraCompatPackages = with pkgs; [
                inputs.chaotic.packages."${pkgs.system}".proton-ge-custom
            ];
        };
    };
}
