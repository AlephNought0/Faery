{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.programs.displayManagers.sddm;
in {
  config = mkIf cfg.enable {
    services.displayManager.sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
    };
  };
}
