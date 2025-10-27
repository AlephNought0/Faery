{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.faery.hardware.audio.pipewire = {
    enable = mkEnableOption "pipewire service.";
  };
}
