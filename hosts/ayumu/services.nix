{pkgs, ...}: {
  services = {
    zerotierone = {
      enable = true;
      joinNetworks = [
        "e3918db4835d47eb"
        "6ab565387af26e69"
        "3efa5cb78a253dd2"
      ];
    };

    jellyfin = {
      enable = true;
      openFirewall = true;
    };

    flatpak.enable = true;
    udisks2.enable = true;
  };

  security.polkit = {
    enable = true; # Maybe not the best place to put in.

    extraConfig = ''
      polkit.addRule(function(action, subject) {
          if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
               action.id == "org.freedesktop.udisks2.filesystem-mount") &&
          subject.isInGroup("storage")) {
              return polkit.Result.YES;
          }
      });
    '';
  };

  systemd = {
    user.services = {
      plasma-polkit-agent = {
        enable = true;
        wantedBy = ["graphical-session.target"];
        wants = ["graphical-session.target"];
        after = ["graphical-session.target"];
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
