{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf mkForce;

  cfg = osConfig.faery.programs.steam;
in {
  config = mkIf cfg.enable {
    xdg.desktopEntries."steam" = mkIf (cfg.scaling != 1.0) (mkForce {
      name = "Steam";
      type = "Application";
      icon = "steam";
      exec = "steam -forcedesktopscaling ${toString cfg.scaling}";
      terminal = false;
      mimeType = ["text/plain"];
    });
  };
}
