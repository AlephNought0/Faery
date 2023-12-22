{
  config,
  lib,
  pkgs,
  ...
}: {
  systemd.services.battery = {
    wantedBy = ["multi-user.target"];
    after = ["multi-user.target"];
    description = "Set the battery charge threshold.";
    serviceConfig = {
      StartLimitBurst = "0";
      Type = "oneshot";
      User = "root";
      Restart = "on-failure";
      ExecStart = "/bin/sh -c 'echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold'";
    };
  };

  systemd.services.Battery.enable = true;
}
