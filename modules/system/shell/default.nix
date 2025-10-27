{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.terminal.shell;
in {
  config = mkIf cfg.zsh {
    programs.zsh.enable = true;
  };
}
