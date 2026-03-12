{osConfig, ...}: {
  imports = [
    ./programs
    ./misc
    ./themes
    ./services
    ./packages.nix
  ];

  config = {
    home = {
      username = "Aperius";
      homeDirectory = "/home/Aperius";
      stateVersion = osConfig.system.stateVersion;
    };

    systemd.user.startServices = "sd-switch";
  };
}
