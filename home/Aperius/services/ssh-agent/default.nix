{
  osConfig,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  cfg = osConfig.faery.services.ssh-agent;
in {
  config = mkIf cfg.enable {
    services.ssh-agent.enable = true;
  };
}
