{
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
      stateVersion = "25.05";
    };

    systemd.user.startServices = "sd-switch";
  };
}
