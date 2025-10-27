{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.hardware.gpu;
in {
  config = mkIf (cfg
    == "nvidia") {
    services.xserver.videoDrivers = ["nvidia"];

    hardware = {
      # I am so lost with nvidia drivers on nix. How do you guys even survive?
      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.linuxKernel.packages.linux_zen.nvidia_x11_vulkan_beta; # Could any one of you nvidia users teach me wth you guys usually use? 🥺
      };

      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
  };
}
