{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.faery.system.services.ssh;
in {
  options.faery.system.services.ssh = {
    enable = mkEnableOption "ssh.";
  };

  config = mkIf cfg.enable {
    services.openssh.enable = true;
  };
}
