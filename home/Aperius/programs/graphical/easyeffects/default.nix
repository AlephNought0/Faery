{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.programs.easyeffects;
  inputContent = builtins.readFile ./input/default.json;
  outputContent = builtins.readFile ./output/default.json;
in {
  config = mkIf cfg.enable {
    services.easyeffects.enable = true;

    /*
      xdg = {
      configFile = {
        # If they do not load automatically then just set them manually and you should be done.
        # Also, turning off voice reduction on discord is recommended if you use these settings.
        "easyeffects/autoload/input/default.json".text = inputContent;
        "easyeffects/autoload/output/default.json".text = outputContent;
        "easyeffects/input/default.json".text = inputContent;
        "easyeffects/output/default.json".text = outputContent;
      };
    };
    */
  };
}
