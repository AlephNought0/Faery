{
  pkgs,
  config,
  ...
}: let
  inherit (config.faery.system) username;
in {
  services.logrotate.enable = true;

  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  home-manager.users."${username}".home.packages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
