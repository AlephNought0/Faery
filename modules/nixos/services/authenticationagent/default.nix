{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.faery.system.services.polkit;
in {
  options.faery.system.services.polkit = {
    enable = mkEnableOption "polkit service.";
  };

  config = mkIf cfg.enable {
    security.polkit.enable = true;

    systemd = {
      user.services.polkit-kde-agent = {
        enable = true;
        wantedBy = ["default.target"];
        wants = ["default.target"];
        after = ["default.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
  };
}
