{lib, ...}: let
  inherit (lib) mkEnableOption mkOption;
in {
  options.faery.user = {
    useHomeManager = mkEnableOption "home-manager.";

    packages = mkOption {
      type = lib.types.listOf lib.types.package;
      default = [];
      description = "List of user specific packages";
    };
  };
}
