{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf mkForce;
  inherit (config.faery.xdg) default_terminal;
  inherit (config.faery.system) username;
  cfg = config.faery.programs.nvf;
in {
  options.faery.programs.nvf = {
    enable = mkEnableOption "nvf module.";
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      xdg.desktopEntries."nvim" = mkForce {
        name = "Neovim";
        type = "Application";
        icon = "nvim";
        exec = "${default_terminal} nvim %F";
        mimeType = ["text/plain"];
      };
    };

    programs.nvf = {
      enable = true;

      settings.vim = {
        package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
        viAlias = false;
        vimAlias = false;
        enableLuaLoader = true;
        preventJunkFiles = true;
        autocomplete.enable = true;
        lineNumberMode = "number";

        extraLuaFiles = [
          ./scripts/DapGuiAutoOpen.lua
        ];

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };

        languages = {
          enableExtraDiagnostics = true;
          enableLSP = true;
          enableTreesitter = true;
          enableFormat = true;
          enableDAP = true;

          clang.enable = true;
          nix.enable = true;
          lua.enable = true;
        };

        git = {
          enable = true;
          gitsigns.enable = true;
        };

        lsp = {
          enable = true;
          lspSignature.enable = true;
          lspconfig.enable = true;
          formatOnSave = true;
        };

        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };

        maps = {
          normal = {
            "<leader>r" = {
              action = "<CMD>Neotree toggle<CR>";
            };

            "<leader>ct" = {
              action = "<CMD>ToggleTerm<CR>";
            };
          };
        };

        debugger = {
          nvim-dap = {
            enable = true;
            ui = {
              enable = true;
              autoStart = false; #No idea why it should close automatically as well.
            };
          };
        };

        statusline.lualine = {
          enable = true;
          theme = "catppuccin";
        };

        tabline.nvimBufferline = {
          enable = true;
          setupOpts = {
            options = {
              numbers = "ordinal";
              sort_by = "insert_at_end";
            };
          };
        };

        filetree.neo-tree = {
          enable = true;
          setupOpts = {
            git_status_async = true;
          };
        };

        treesitter = {
          enable = true;
          fold = true;
        };

        visuals = {
          enable = true;
          nvimWebDevicons.enable = true;
        };
      };
    };
  };
}
