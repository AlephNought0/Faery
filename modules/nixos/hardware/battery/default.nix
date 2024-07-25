{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.faery.system.hardware.battery;
in {
  options.faery.system.hardware.battery = {
    enable = mkEnableOption "battery threshold service.";
  };

  config = mkIf cfg.enable {
    systemd.services.battery = {
      enable = true;
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
  };
}
