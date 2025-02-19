{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.system.performance;
in {
  config = mkIf cfg.kernel {
    boot = {
      kernelParams = [
        #Disable tickless kernel to improve performance
        "nohz=off"

        #Force TSC instead of HPET
        "hpet=disable"
        "clocksource=tsc"
        "tsc=reliable"
      ];
    };
  };
}
