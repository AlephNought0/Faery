{
  config,
  lib,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "Cirno";

  system.stateVersion = "24.05";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CONFIG_DIRS = ["$HOME/.config/kdedefaults"];
    #EGL_PLATFORM = "wayland";
  };
}
