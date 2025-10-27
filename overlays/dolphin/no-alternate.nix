{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.faery.overlays.dolphin;
in {
  options.faery.overlays.dolphin.no-alternate = mkEnableOption "overlay that removes alternate backgrounds from dolphin.";

  config = mkIf cfg.no-alternate {
    nixpkgs.overlays = mkIf cfg.no-alternate [
      (self: super: {
        kdePackages =
          super.kdePackages
          // {
            dolphin = super.kdePackages.dolphin.overrideAttrs (oldAttrs: {
              patches =
                (oldAttrs.patches or [])
                ++ [
                  ./no-alternate.patch
                ];
            });
          };
      })
    ];
  };
}
