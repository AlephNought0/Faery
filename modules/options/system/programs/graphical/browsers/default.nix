{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.faery.programs.browsers = {
    firefox = {
      enable = mkEnableOption "firefox.";
      dGPU = mkEnableOption "dGPU for firefox";
    };

    floorp.enable = mkEnableOption "floorp.";
  };
}
