{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.faery.system) username;

  cfg = config.faery.programs.docker;
in {
  options.faery.programs.docker = {
    enable = mkEnableOption "docker module.";
  };

  config = mkIf cfg.enable {
    home-manager.users.${username}.home.packages = with pkgs; [
      docker
    ];

    virtualisation.docker.enable = true;
    users.users.${username}.extraGroups = ["docker"];
  };
}
