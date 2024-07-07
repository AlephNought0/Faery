{ config, lib, pkgs, ... }:
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
        home-manager.users.${username}.home.packages = with pkgs; [
            gamescope
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
                proton-ge-bin
            ];
        };
    };
}
