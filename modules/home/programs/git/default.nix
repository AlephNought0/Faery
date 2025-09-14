{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.faery.programs.git;
in {
  options.faery.programs.git = {
    enable = mkEnableOption "git module.";
  };

  config = mkIf cfg.enable {
    home.file.".ssh/allowed_signers".text = "* ${builtins.readFile /home/nelson/.ssh/id_ed25519.pub}";

    programs.git = {
      enable = true;
      userName = "AlephNought0";
      userEmail = "aleph@nought.dev";

      #Learned from https://jeppesen.io/git-commit-sign-nix-home-manager-ssh/
      extraConfig = {
        # Sign all commits using ssh key
        commit.gpgsign = true;
        gpg.format = "ssh";
        user.signingkey = "~/.ssh/id_ed25519.pub";
      };
    };
  };
}
