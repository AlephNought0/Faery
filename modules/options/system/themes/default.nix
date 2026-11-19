{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.faery.theme = {
    qt = {
      enable = mkEnableOption "qt theming";
    };

    catppuccin.enable = mkEnableOption "catppucin theming";
  };
}
