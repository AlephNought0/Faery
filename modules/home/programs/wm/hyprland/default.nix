{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) mkOption mkEnableOption mkIf optionals concatLists;
  inherit (lib.types) float;
  inherit (config.faery.system) username;

  cfg = config.faery.programs.hyprland;
in {
  options.faery.programs.hyprland = {
    enable = mkEnableOption "hyprland module.";
    enableDebug = mkEnableOption "hyprland debug mode.";

    scaling = mkOption {
      type = float;
      description = "Monitor scaling for hyprland";
      default = 1.0;
    };
  };

  config = mkIf cfg.enable {
    nix.settings = {
      substituters = [
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };

    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      portalPackage = inputs.hyprland.packages."${pkgs.system}".xdg-desktop-portal-hyprland;
    };

    home-manager.users.${username} = {
      home.packages = with pkgs; [
        kdePackages.xwaylandvideobridge
        rofi-wayland
        inputs.hyprcursor.packages."${pkgs.system}".hyprcursor
        inputs.swww.packages."${pkgs.system}".swww
        grim
        wl-clipboard
        slurp
      ];

      wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages."${pkgs.system}".hyprland;
        xwayland.enable = true;

        systemd = {
          enable = true;
          variables = ["--all"];
          extraCommands = [
            "systemctl --user stop xdg-desktop-portal" #They seem to be conflicting which makes streaming not work
            "systemctl --user start xdg-desktop-portal-hyprland"
            "systemctl --user start opentabletdriver.service"
          ];
        };

        settings = {
          "$mainMod" = "SUPER";

          monitor = ",preferred,auto,${toString cfg.scaling}";

          exec-once = [
            "swww-daemon"
            "env DRI_PRIME=1 firefox-nightly"
            "wl-gammarelay-rs run"
          ];

          misc = {
            focus_on_activate = true;
            force_default_wallpaper = -1;
            vrr = 1;
            vfr = true;
            enable_anr_dialog = false;
          };

          xwayland = {
            force_zero_scaling = true;
          };

          env = concatLists [
            [
              "XDG_SESSION_TYPE, wayland"
              "GDK_BACKEND, wayland,x11"
              "CLUTTER_BACKEND, wayland"
              "QT_QPA_PLATFORM, wayland;xcb"
              "HYPRCURSOR_THEME, rose-pine-hyprcursor"
              "HYPRCURSOR_SIZE,30"
              "AQ_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"

              "GDK_SCALE, ${toString cfg.scaling}"

              "XDG_CURRENT_DESKTOP, Hyprland"
              "XDG_SESSION_DESKTOP, Hyprland"
            ]
            (optionals cfg.enableDebug [
              "HYPRLAND_LOG_WLR, 1"
              "HYPRLAND_TRACE, 1"
            ])
          ];

          layerrule = [
            "noanim,^(selection)$"
            "blur, ohio"
            "blurpopups, ohio"
            "ignorezero, ohio"
          ];

          input = {
            kb_layout = "us";
            follow_mouse = "1";

            touchpad = {
              natural_scroll = false;
            };

            sensitivity = -0.5;
          };

          general = {
            gaps_in = 5;
            gaps_out = 20;
            border_size = 2;
            "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
            "col.inactive_border" = "rgba(595959aa)";
            layout = "dwindle";
          };

          decoration = {
            rounding = 10;

            blur = {
              enabled = true;
              size = 5;
              passes = 1;
              new_optimizations = true;
              noise = 0.026;
              contrast = 1;
              vibrancy_darkness = 0.11;
              vibrancy = 0.22;
            };

            shadow = {
              enabled = true;
              range = 4;
              render_power = 3;
              color = "rgba(1a1a1aee)";
            };
          };

          animations = {
            enabled = true;
            bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

            animation = [
              "windows, 1, 7, myBezier"
              "windowsOut, 1, 7, default, popin 80%"
              "border, 1, 10, default"
              "borderangle, 1, 8, default"
              "fade, 1, 7, default"
              "workspaces, 1, 6, default"
            ];
          };

          dwindle = {
            pseudotile = true;
            preserve_split = true;
          };

          master = {
            new_status = "master";
          };

          gestures = {
            workspace_swipe = false;
          };

          bind = [
            "$mainMod, Q, exec, foot"
            "$mainMod, C, killactive,"
            "$mainMod, M, exit,"
            "$mainMod, E, exec, dolphin"
            "$mainMod, V, togglefloating,"
            "$mainMod, P, pseudo, # dwindle"
            "$mainMod, J, togglesplit," # dwindle
            "$mainMod, SPACE, exec, rofi -show drun"
            "$mainMod, F, fullscreen"
            ", Print, exec, grim -g \"$(slurp)\" - | wl-copy"
            "$mainMod, Print, exec, grim"

            # Move focus with mainMod + arrow keys
            "$mainMod, left, movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up, movefocus, u"
            "$mainMod, down, movefocus, d"

            # Switch workspaces with mainMod + [0-9]
            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"
            "$mainMod, 0, workspace, 10"

            # Move active window to a workspace with mainMod + SHIFT + [0-9]
            "$mainMod SHIFT, 1, movetoworkspace, 1"
            "$mainMod SHIFT, 2, movetoworkspace, 2"
            "$mainMod SHIFT, 3, movetoworkspace, 3"
            "$mainMod SHIFT, 4, movetoworkspace, 4"
            "$mainMod SHIFT, 5, movetoworkspace, 5"
            "$mainMod SHIFT, 6, movetoworkspace, 6"
            "$mainMod SHIFT, 7, movetoworkspace, 7"
            "$mainMod SHIFT, 8, movetoworkspace, 8"
            "$mainMod SHIFT, 9, movetoworkspace, 9"
            "$mainMod SHIFT, 0, movetoworkspace, 10"

            # Scroll through existing workspaces with mainMod + scroll
            "$mainMod, mouse_down, workspace, e+1"
            "$mainMod, mouse_up, workspace, e-1"
          ];

          bindm = [
            # Move/resize windows with mainMod + LMB/RMB and dragging
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
          ];
        };
      };
    };
  };
}
