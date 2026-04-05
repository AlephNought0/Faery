{
  osConfig,
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.programs.quickshell;
in {
  config = mkIf cfg.enable {
    programs.quickshell = {
      enable = true;
      package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
  };
}
