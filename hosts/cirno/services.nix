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

  systemd = {
    user.services = {
      polkit-kde-agent = {
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
