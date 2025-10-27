{lib, ...}: let
  inherit (lib) mkOption;
  inherit (lib.types) enum;
in {
  options.faery.hardware.cpu = mkOption {
    type = enum ["amd" "intel"];
    description = "Installs the drivers and microcode for the cpu of the specified manufacturer";
  };
}
