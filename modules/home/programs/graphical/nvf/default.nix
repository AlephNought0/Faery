{ config, lib, ... }:
let
    inherit (lib) mkEnableOption mkIf;

    cfg = config.faery.programs.nvf;
in
{
    options.faery.programs.nvf = {
        enable = mkEnableOption "nvf module.";
    };

    config = mkIf cfg.enable {
        programs.nvf = {
            enable = true;

            settings.vim = {
                viAlias = false;
                vimAlias = false;
                enableLuaLoader = true;
                preventJunkFiles = true; #sex
        
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
                    normal = {
                        "<leader>t" = {
                            action = "<CMD>Neotree toggle<CR>";
                            silent = true;
                        };
                    };
                };

                filetree.neo-tree.enable = true;
                treesitter.enable = true;
            };
        };
    };
}

