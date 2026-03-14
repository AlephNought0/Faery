{osConfig, ...}: {
  config = {
    home.packages = osConfig.faery.user.packages;
    services.syncthing.enable = true;
  };
}
