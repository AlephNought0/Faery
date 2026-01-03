{lib, ...}: {
  # TODO: Figure out how to organize all of that.
  networking.hostName = "Ayumu";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    XDG_SESSION_TYPE = "wayland";
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
    DIRENV_WARN_TIMEOUT = "0s";
    GTK_USE_PORTAL = 1; # I wonder if I can also make apps just not install the gtk file selector altogether.
  };

  time.timeZone = "Europe/Berlin"; # Doxxed!11!!
  i18n.defaultLocale = "en_US.UTF-8";
}
