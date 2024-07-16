{ config, lib, inputs, pkgs, ... }:
let
    inherit (lib) mkEnableOption mkIf;

    cfg = config.faery.programs.browsers.brave;
in
{
    options.faery.programs.browsers.brave = {
        enable = mkEnableOption "brave browser module.";
    };

    config = mkIf cfg.enable {
        home-manager.users.${username}.home.packages = with pkgs; [
            brave
        ];
    };
}
