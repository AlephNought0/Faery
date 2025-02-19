{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.faery.programs.sddm;
in {
  options.faery.programs.displaymanager.sddm = {
    #For now only SDDM, it is arguably the best one imo but I will add more Display Managers if requested.
    enable = mkEnableOption "SDDM module.";
  };

  config = mkIf cfg.enable {
    services.displayManager.sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
    };
  };
}
