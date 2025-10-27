{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.faery.user.useHomeManager = mkEnableOption "home-manager.";
}
