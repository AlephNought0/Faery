{osConfig, ...}: {
  imports = [
    ./programs
    ./misc
    ./themes
    ./services
  ];

  config = {
    home = {
      username = "Aperius";
      homeDirectory = "/home/Aperius";
      stateVersion = osConfig.system.stateVersion;
      packages = osConfig.faery.user.packages;
    };

    systemd.user.startServices = "sd-switch";
  };
}
