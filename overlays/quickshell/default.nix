{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkIf concatLists;

  cfg = config.faery.overlays.quickshell;
in {
  options.faery.overlays.quickshell = mkEnableOption "overlay that enables qsettings in quickshell.";

  config = mkIf cfg {
    nixpkgs.overlays = [
      (self: super: {
        quickshell = super.quickshell.overrideAttrs (old: {
          patches = concatLists [
            (old.patches or [])
            [./quickpatch.patch]
          ];
        });
      })
    ];
  };
}
