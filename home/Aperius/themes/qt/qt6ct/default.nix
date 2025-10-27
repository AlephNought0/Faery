{
  osConfig,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.theme.qt;
in {
  config = mkIf (cfg.platformTheme
    == "qt5ct") {
    home.packages = with pkgs;
      lib.optional (cfg.style == "kvantum") kdePackages.qtstyleplugin-kvantum
      ++ [kdePackages.qt6ct];

    xdg.configFile = {
      "qt6ct/qt6ct.conf".text = ''
        [Appearance]
        color_scheme_path=${pkgs.kdePackages.qt6ct}/share/qt6ct/colors/${cfg.colorScheme}.conf
        custom_palette=true
        icon_theme=${cfg.iconTheme}
        standard_dialogs=${cfg.standardDialogs}
        style=${cfg.style}

        [Fonts]
        fixed="DejaVu Sans,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
        general="DejaVu Sans,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"

        [Interface]
        activate_item_on_single_click=1
        buttonbox_layout=0
        cursor_flash_time=1000
        dialog_buttons_have_icons=1
        double_click_interval=400
        gui_effects=@Invalid()
        keyboard_scheme=2
        menus_have_icons=true
        show_shortcuts_in_context_menus=true
        stylesheets=${./toolbar-invis.qss}
        toolbutton_style=4
        underline_shortcut=1
        wheel_scroll_lines=3

        [QSSEditor]
        geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\x5\0\0\0\0\0\0\0\a\x82\0\0\x1\xf2\0\0\x5\0\0\0\0\0\0\0\a\x82\0\0\x1\xf2\0\0\0\0\0\0\0\0\x6\xab\0\0\x5\0\0\0\0\0\0\0\a\x82\0\0\x1\xf2)

        [SettingsWindow]
        geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\x5\0\0\0\0\0\0\0\b<\0\0\x3\x9f\0\0\x5\0\0\0\0\0\0\0\b<\0\0\x3\x9f\0\0\0\0\0\0\0\0\x6\xab\0\0\x5\0\0\0\0\0\0\0\b<\0\0\x3\x9f)

        [Troubleshooting]
        force_raster_widgets=1
        ignored_applications=@Invalid()
      '';
    };
  };
}
