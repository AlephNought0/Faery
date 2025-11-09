{
  osConfig,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.programs.easyeffects;
  inputContent = builtins.readFile ./input/default.json;
  outputContent = builtins.readFile ./output/default.json;
in {
  config = mkIf cfg.enable {
    services.easyeffects.enable = true;

    # Fixes easyeffects hanging during shutdown. I already made a pull request on the home-manager repository.
    systemd.user.services.easyeffects = lib.mkForce {
      Unit = {
        Description = "Easyeffects daemon";
        Before = ["pipewire.service" "pipewire-pulse.service" "dbus.service"];
        Wants = ["pipewire.service" "pipewire-pulse.service" "dbus.service"];
        Requires = ["dbus.service"];
      };

      Service = {
        ExecStart = "${pkgs.easyeffects}/bin/easyeffects --gapplication-service";
        ExecStop = "${pkgs.easyeffects}/bin/easyeffects --quit";
        Type = "dbus";
        BusName = "com.github.wwmm.easyeffects";
        KillMode = "mixed";
        Restart = "on-failure";
        RestartSec = 5;
      };

      Install = {
        WantedBy = ["graphical-session.target"];
      };
    };

    xdg = {
      configFile = {
        # If they do not load automatically then just set them manually and you should be done.
        # Also, turning off voice reduction on discord is recommended if you use these settings.
        "easyeffects/autoload/input/default.json".text = inputContent;
        "easyeffects/autoload/output/default.json".text = outputContent;
        "easyeffects/input/default.json".text = inputContent;
        "easyeffects/output/default.json".text = outputContent;
      };
    };
  };
}
