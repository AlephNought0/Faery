{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    arrpc
  ];

  systemd.services.arrpc = {
      description = "arRPC";
      wantedBy = ["multi-user.target"];
      wants = ["multi-user.target"];
      after = ["multi-user.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "arrpc";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
  };

  systemd.services.arrpc.enable = true;
}
