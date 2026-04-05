{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  cfg = config.faery.programs.wms.niri;
in {
  config = mkIf cfg.enable {
    programs.niri = {
      enable = true;
      package = let
        niriSrc = pkgs.fetchFromGitHub {
          owner = "niri-wm";
          repo = "niri";
          rev = "wip/branch";
          hash = "sha256-SjtRwCTG0IIJKmxfCHj9gNm42eN4ohge3XVxx9JwQjc=";
        };
      in
        pkgs.niri.overrideAttrs (old: {
          src = niriSrc;
          cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
            src = niriSrc;
            hash = "sha256-soJYT6TavlyqtVqMD70QYDZ+8swn6TVXsFHadJxaxWo=";
          };
          postPatch = ''
            patchShebangs resources/niri-session
            substituteInPlace resources/niri.service \
              --replace-fail 'niri --session' "$out/bin/niri --session"
          '';
        });
    };
  };
}
