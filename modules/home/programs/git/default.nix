{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.faery.system) username;

  cfg = config.faery.programs.git;
in {
  options.faery.programs.git = {
    enable = mkEnableOption "git module.";
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      programs.git = {
        enable = true;
        userName = "AlephNought0";
        userEmail = "aleph@nought.dev";

        # Learned from https://jeppesen.io/git-commit-sign-nix-home-manager-ssh/
        extraConfig = {
          # Sign all commits using ssh key
          commit.gpgsign = true;
          gpg.format = "ssh";
          gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
          user.signingkey = "~/.ssh/id_ed25519.pub";
        };
      };
    };
  };
}
