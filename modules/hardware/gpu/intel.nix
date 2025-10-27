{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.hardware.gpu;
in {
  config = mkIf (cfg
    == "intel") {
    services.xserver.videoDrivers = ["modesetting"];

    # Seems like intel dGPUs are content with this only.
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          vpl-gpu-rt
        ];
      };
    };
  };
}
