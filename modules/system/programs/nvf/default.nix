{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf mkForce;
  cfg = config.faery.programs.tui.nvf;
in
{
  config = mkIf cfg.enable {
    programs.nvf = {
      enable = true;

      settings.vim = {
        package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
        viAlias = false;
        vimAlias = false;
        enableLuaLoader = true;
        preventJunkFiles = true;
        autocomplete.nvim-cmp.enable = true;
        autopairs.nvim-autopairs.enable = true;
        lineNumberMode = "number";

        options = {
          shiftwidth = 2;
          tabstop = 2;
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };

        languages = {
          enableExtraDiagnostics = true;
          enableTreesitter = true;
          enableFormat = true;
          enableDAP = true;

          clang.enable = true;
          zig.enable = true;
          nix.enable = true;
          lua.enable = true;
          bash.enable = true;
          html.enable = true;
          ts.enable = true;
          astro.enable = true;
          php.enable = true;
          css.enable = true;
          sql.enable = true;
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

            "<leader>tt" = {
              action = "<CMD>ToggleTerm<CR>";
            };

            "<leader>cb" = mkForce {
              action = "<CMD>CMakeBuild<CR>";
            };

            "<leader>f" = {
              action = "<CMD>lua vim.diagnostic.open_float()<CR>";
            };
          };
        };

        debugger = {
          nvim-dap = {
            enable = true;
            ui = {
              enable = true;
              autoStart = false; # No idea why it should close automatically as well.
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
            filesystem = {
              filtered_items = {
                visible = false;
                hide_dotfiles = false;
                hide_by_name = [
                  "package-lock.json"
                  ".changeset"
                  ".prettierrc.json"
                ];
                never_show = [ ".git" ];
              };
            };
          };
        };

        treesitter = {
          enable = true;
          fold = true;
        };

        telescope.enable = true;
      };
    };
  };
}
