{
  config,
  lib,
  ...
}: let
  inherit (lib) mkOption concatLists;
  inherit (lib.types) str listOf;

  cfg = config.faery.system;
in {
  options.faery.system = {
    username = mkOption {
      type = str;
      description = "The name of user account.";
    };

    hostname = mkOption {
      type = str;
      description = "The name of the system.";
    };

    extraGroups = mkOption {
      type = listOf str;
      description = "Extra groups for the user.";
      default = [];
    };
  };

  config = {
    networking.hostName = cfg.hostname;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    system.stateVersion = "25.05";
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = ["nix-command" "flakes"];

    users.users."${cfg.username}" = {
      isNormalUser = true;
      extraGroups = concatLists [
        [
          "wheel"
          "video"
        ]
        cfg.extraGroups
      ];
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      XDG_SESSION_TYPE = "wayland";
      CLUTTER_BACKEND = "wayland";
      GDK_BACKEND = "wayland";
    };

    time.timeZone = "Europe/Bratislava";
    i18n.defaultLocale = "en_US.UTF-8";

    services.upower.enable = true;
  };
}
