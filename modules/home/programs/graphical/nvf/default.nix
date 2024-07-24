{ config, lib, pkgs, ... }:
let
    inherit (lib) mkEnableOption mkIf;
    inherit (config.faery.xdg) default_terminal;
    cfg = config.faery.programs.nvf;
    
    modified-nvf = pkgs.neovim-unwrapped.overrideAttrs (oldAttrs: {
      postInstall = oldAttrs.postInstall + ''
        substituteInPlace $out/share/applications/nvim.desktop \
          --replace "Exec=nvim %F" "Exec=${default_terminal} nvim %F" \
          --replace "Terminal=true" "Terminal=false"
        '';
      });
in
{
    options.faery.programs.nvf = {
        enable = mkEnableOption "nvf module.";
    };

    config = mkIf cfg.enable {
        programs.nvf = {
            enable = true;

            settings.vim = {
                package = modified-nvf;
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

