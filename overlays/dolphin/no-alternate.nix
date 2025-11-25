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

      # Lazy people win in life trust me
      (final: prev: {
        spotify = prev.spotify.overrideAttrs (oldAttrs: {
          version = "1.2.74.477.g3be53afe"; # Your desired version
          rev = "89"; # The revision number from snapcraft
          src = final.fetchurl {
            name = "spotify-1.2.74.477.g3be53afe-89.snap";
            url = "https://api.snapcraft.io/api/v1/snaps/download/pOBIoZ2LrCB3rDohMxoYGnbN14EHOgD7_89.snap";
            hash = "sha512-mn1w/Ylt9weFgV67tB435CoF2/4V+F6gu1LUXY07J6m5nxi1PCewHNFm8/11qBRO/i7mpMwhcRXaiv0HkFAjYA==";
          };
        });
      })
    ];
  };
}
