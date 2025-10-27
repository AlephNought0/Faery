{
  config = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          email = "aleph@nought.dev";
          name = "AlephNought0";
        };
        # Sign all commits using ssh key
        # Learned from https://jeppesen.io/git-commit-sign-nix-home-manager-ssh/
        commit.gpgsign = true;
        gpg.format = "ssh";
        gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
        user.signingkey = "~/.ssh/id_ed25519.pub";
      };
    };
  };
}
