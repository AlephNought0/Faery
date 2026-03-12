{osConfig, ...}: {
  config = {
    home.packages = osConfig.faery.user.packages;
  };
}
