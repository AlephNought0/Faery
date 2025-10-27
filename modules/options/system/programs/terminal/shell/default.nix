{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.faery.terminal.shell.zsh = mkEnableOption "zsh";
}
