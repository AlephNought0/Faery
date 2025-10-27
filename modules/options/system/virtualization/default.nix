{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.faery.virtualization.qemu = {
    enable = mkEnableOption "qemu module.";
  };
}
