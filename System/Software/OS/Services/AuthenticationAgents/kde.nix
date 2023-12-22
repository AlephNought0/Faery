{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    libsForQt5.polkit-kde-agent
  ];

  security.polkit.enable = true;

  systemd = {
    user.services.polkit-kde-agent = {
      description = "libsForQt5.polkit-kde-agent";
      wantedBy = ["default.target"];
      wants = ["default.target"];
      after = ["default.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  systemd.user.services.polkit-kde-agent.enable = true;
}
