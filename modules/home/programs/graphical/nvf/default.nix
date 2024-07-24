{ config, lib, ... }:
let
    inherit (lib) mkEnableOption mkIf mkForce;
    inherit (config.faery.xdg) default_terminal;
    inherit (config.faery.system) username;
    cfg = config.faery.programs.nvf;
    
in
{
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
                viAlias = false;
                vimAlias = false;
                enableLuaLoader = true;
                preventJunkFiles = true;
        
                theme  = {
                    enable = true;
                    name = "catppuccin";
                    style = "frappe";
                };

                languages = {
                    enableExtraDiagnostics = true;
                    enableLSP = true;
                    enableTreesitter = true;

                    clang.enable = true;
                    nix.enable = true;
                };

                maps = {
                    /*normal = {
                        "<leader>t" = {
                            action = "<CMD>NvimTreeToggle<CR>";
                            silent = true;
                        };
                    };*/
                };

                git = {
                  enable = true;
                  gitsigns.enable = true;
                };

                lsp = {
                  enable = true;
                  lspSignature.enable = true;
                  lspconfig.enable = true;
                };

                lineNumberMode = "number";
                autocomplete.enable = true;
                
                statusline.lualine = {
                  enable = true;
                  theme = "catppuccin";
                };
                
                tabline.nvimBufferline = {
                  enable = true;
                  setupOpts = {
                    highlights = {
                      
                    };

                    options = {
                      numbers = "ordinal";
                      sort_by = "insert_at_end";
                    };                    
                  };
                };

                filetree.nvimTree = {
                  enable = true;
                  setupOpts = {
                    git.enable = true;
                    modified.enable = true;
                    renderer.icons.show.file = true;
                  };
                };

                treesitter.enable = true;
                visuals.nvimWebDevicons.enable = true;
            };
        };
    };
}

