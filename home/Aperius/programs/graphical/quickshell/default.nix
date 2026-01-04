{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf concatLists;

  cfg = osConfig.faery.programs.quickshell;
in {
  config = mkIf cfg.enable {
    programs.quickshell.enable = true;

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
