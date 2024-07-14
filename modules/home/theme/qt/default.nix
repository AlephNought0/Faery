{ config, lib, pkgs, ... }:
let
    inherit (lib) mkOption mkEnableOption mkIf;
    inherit (lib.types) str;
    inherit (config.faery.system) username;

    cfg = config.faery.theme.qt;
in
{
    options.faery.theme.qt = {
        enable = mkEnableOption "qt module.";

        platformTheme = mkOption {
            type = str;
            description = "Platform theme for qt.";
            default = "qt5ct";
        };

        style = mkOption {
            type = str;
            description = "Style for qt.";
            default = "kvantum";
        };
    };

    config = mkIf cfg.enable {
        qt = {
            enable = true;
            platformTheme = cfg.platformTheme;
            style = cfg.style;
        };

        home-manager.users.${username} = {
            xdg.configFile = {
                "Kvantum/kvantum.kvconfig".text = ''
                [General]
                theme=LayanDark
                '';

                "Kvantum/LayanDark".source = "${pkgs.layan-kde}/share/Kvantum/Layan";
            };

            home.packages = with pkgs; [
                tela-icon-theme
                libsForQt5.qtstyleplugin-kvantum
                kdePackages.qt6ct
            ];
        };

        nixpkgs.overlays = [
            (self: super: {
                layan-kde = super.layan-kde.overrideAttrs {
                postFixup = ''
                    echo "[%General]
                        x11drag=all
                        alt_mnemonic=true
                        left_tabs=true
                    attach_active_tab=false
                    mirror_doc_tabs=true
                    group_toolbar_buttons=false
                    toolbar_item_spacing=0
                    toolbar_interior_spacing=2
                    spread_progressbar=true
                    composite=true
                    menu_shadow_depth=10
                    spread_menuitems=false
                    tooltip_shadow_depth=10
                    splitter_width=1
                    scroll_width=9
                    scroll_arrows=false
                    scroll_min_extent=60
                    slider_width=2
                    slider_handle_width=23
                    slider_handle_length=22
                    tickless_slider_handle_size=22
                    center_toolbar_handle=true
                    check_size=16
                    textless_progressbar=false
                    progressbar_thickness=2
                    menubar_mouse_tracking=true
                    toolbutton_style=1
                    double_click=false
                    translucent_windows=true
                    blurring=true
                    popup_blurring=true
                    vertical_spin_indicators=false
                    spin_button_width=24
                    fill_rubberband=false
                    merge_menubar_with_toolbar=true
                    small_icon_size=16
                    large_icon_size=32
                    button_icon_size=16
                    toolbar_icon_size=16
                    combo_as_lineedit=true
                    animate_states=true
                    button_contents_shift=false
                    combo_menu=true
                    hide_combo_checkboxes=true
                    combo_focus_rect=false
                    groupbox_top_label=true
                    inline_spin_indicators=true
                    joined_inactive_tabs=true
                    layout_spacing=6
                    layout_margin=9
                    scrollbar_in_view=true
                    transient_scrollbar=true
                    transient_groove=true
                    submenu_overlap=0
                    tooltip_delay=-1
                    tree_branch_line=true
                    no_window_pattern=false
                    opaque=kaffeine,kmplayer,subtitlecomposer,kdenlive,vlc,smplayer,smplayer2,avidemux,avidemux2_qt4,avidemux3_qt4,avidemux3_qt5,kamoso,QtCreator,VirtualBox,trojita,dragon,digikam
                    reduce_window_opacity=0
                    respect_DE=true
                    scrollable_menu=false
                    submenu_delay=250
                    no_inactiveness=false
                    reduce_menu_opacity=0
                    contrast=1.00
                    dialog_button_layout=0
                    intensity=1.00
                    saturation=1.00
                    click_behavior=0
                    shadowless_popup=false
                    drag_from_buttons=false
                    menu_blur_radius=6
                    tooltip_blur_radius=6

                    [GeneralColors]
                    window.color=#31313A
                    base.color=#34343B
                    alt.base.color=#31313A00
                    button.color=#31313A
                    light.color=#44454B
                    mid.light.color=#44454B
                    dark.color=#25252d
                    mid.color=#44454B
                    highlight.color=#5657f5
                    inactive.highlight.color=#5657f5
                    text.color=#dfdfdf
                    window.text.color=#dfdfdf
                    button.text.color=#dfdfdf
                    disabled.text.color=#696969
                    tooltip.text.color=#eefcff
                    highlight.text.color=white
                    link.color=#0057AE
                    link.visited.color=#E040FB
                    progress.indicator.text.color=#ffffff

                    [Hacks]
                    transparent_ktitle_label=true
                    transparent_dolphin_view=true
                    transparent_pcmanfm_sidepane=true
                    blur_translucent=true
                    transparent_menutitle=true
                    respect_darkness=true
                    kcapacitybar_as_progressbar=true
                    force_size_grip=true
                    iconless_pushbutton=true
                    iconless_menu=false
                    disabled_icon_opacity=100
                    lxqtmainmenu_iconsize=16
                    normal_default_pushbutton=true
                    single_top_toolbar=true
                    tint_on_mouseover=0
                    transparent_pcmanfm_view=true
                    no_selection_tint=true
                    transparent_arrow_button=false
                    middle_click_scroll=false
                    opaque_colors=false
                    scroll_jump_workaround=true
                    kinetic_scrolling=true
                    blur_only_active_window=false
                    centered_forms=false
                    noninteger_translucency=false
                    style_vertical_toolbars=false

                    [PanelButtonCommand]
                    frame=true
                    frame.element=button
                    frame.top=6
                    frame.bottom=10
                    frame.left=7
                    frame.right=7
                    interior=true
                    interior.element=button
                    indicator.size=8
                    text.normal.color=#dfdfdf
                    text.focus.color=white
                    text.press.color=#dfdfdf
                    text.toggle.color=white
                    text.shadow=0
                    text.margin=1
                    text.iconspacing=4
                    indicator.element=arrow
                    text.margin.top=2
                    text.margin.bottom=3
                    text.margin.left=2
                    text.margin.right=2
                    frame.expansion=0

                    [PanelButtonTool]
                    inherits=PanelButtonCommand
                    interior.element=flatbutton
                    frame=true
                    frame.element=flatbutton
                    frame.top=6
                    frame.bottom=6
                    frame.left=6
                    frame.right=6
                    text.iconspacing=0
                    text.normal.color=#dfdfdf
                    text.focus.color=#dfdfdf
                    text.press.color=#ffffff
                    text.toggle.color=white
                    text.bold=false

                    [ToolbarButton]
                    frame=true
                    frame.element=tbutton
                    frame.top=6
                    frame.bottom=10
                    frame.left=7
                    frame.right=7
                    interior.element=tbutton
                    indicator.element=tarrow
                    text.normal.color=#dfdfdf
                    text.focus.color=white
                    text.press.color=white
                    text.toggle.color=white
                    text.bold=false

                    [Dock]
                    inherits=PanelButtonCommand
                    interior.element=dock
                    frame.element=dock
                    frame.top=1
                    frame.bottom=1
                    frame.left=1
                    frame.right=1
                    text.normal.color=#dfdfdf

                    [DockTitle]
                    inherits=PanelButtonCommand
                    frame=false
                    interior=false
                    text.normal.color=#dfdfdf
                    text.focus.color=white
                    text.bold=false

                    [IndicatorSpinBox]
                    inherits=PanelButtonCommand
                    frame=true
                    interior=true
                    frame.top=2
                    frame.bottom=2
                    frame.left=2
                    frame.right=2
                    indicator.element=spin
                    indicator.size=8
                    text.normal.color=#dfdfdf
                    text.margin.top=2
                    text.margin.bottom=2
                    text.margin.left=2
                    text.margin.right=2

                    [RadioButton]
                    inherits=PanelButtonCommand
                    frame=false
                    interior.element=radio
                    text.normal.color=#dfdfdf
                    text.focus.color=white
                    min_width=+0.3font
                    min_height=+0.3font

                    [CheckBox]
                    inherits=PanelButtonCommand
                    frame=false
                    interior.element=checkbox
                    text.normal.color=#dfdfdf
                    text.focus.color=white
                    min_width=+0.3font
                    min_height=+0.3font

                    [Focus]
                    inherits=PanelButtonCommand
                    frame=true
                    frame.element=focus
                    frame.top=2
                    frame.bottom=2
                    frame.left=2
                    frame.right=2
                    frame.patternsize=14

                    [GenericFrame]
                    inherits=PanelButtonCommand
                    frame=true
                    interior=false
                    frame.element=common
                    interior.element=common
                    frame.top=1
                    frame.bottom=1
                    frame.left=1
                    frame.right=1

                    [LineEdit]
                    inherits=PanelButtonCommand
                    frame.element=lineedit
                    interior.element=lineedit
                    interior=false
                    frame.top=2
                    frame.bottom=2
                    frame.left=2
                    frame.right=2
                    text.margin.top=2
                    text.margin.bottom=2
                    text.margin.left=2
                    text.margin.right=2
                    frame.expansion=0

                    [ToolbarLineEdit]
                    frame.element=lineedit

                    [DropDownButton]
                    inherits=PanelButtonCommand
                    indicator.element=arrow-down

                    [IndicatorArrow]
                    indicator.element=arrow
                    indicator.size=8

                    [ToolboxTab]
                    inherits=PanelButtonCommand
                    text.normal.color=#dfdfdf
                    text.press.color=#dfdfdf
                    text.focus.color=white

                    [Tab]
                    inherits=PanelButtonCommand
                    interior.element=tab
                    text.margin.left=8
                    text.margin.right=8
                    text.margin.top=2
                    text.margin.bottom=2
                    frame.element=tab
                    indicator.element=tab
                    indicator.size=22
                    frame.top=2
                    frame.bottom=2
                    frame.left=2
                    frame.right=2
                    text.normal.color=#dfdfdf
                    text.focus.color=#dfdfdf
                    text.press.color=#dfdfdf
                    text.toggle.color=#dfdfdf
                    frame.expansion=0
                    text.bold=false

                    [TabFrame]
                    inherits=PanelButtonCommand
                    frame.element=tabframe
                    interior.element=tabframe
                    frame.top=2
                    frame.bottom=2
                    frame.left=2
                    frame.right=2

                    [TreeExpander]
                    inherits=PanelButtonCommand
                    indicator.size=8
                    indicator.element=tree

                    [HeaderSection]
                    inherits=PanelButtonCommand
                    interior.element=header
                    frame.element=header
                    frame.top=0
                    frame.bottom=1
                    frame.left=1
                    frame.right=1
                    text.normal.color=#dfdfdf
                    text.focus.color=white
                    text.press.color=white
                    text.toggle.color=white
                    frame.expansion=0

                    [SizeGrip]
                    indicator.element=resize-grip

                    [Toolbar]
                    inherits=PanelButtonCommand
                    indicator.element=toolbar
                    indicator.size=5
                    text.margin=0
                    interior.element=menubar
                    frame.element=menubar
                    text.normal.color=#dfdfdf
                    text.focus.color=white
                    text.press.color=#dfdfdf
                    text.toggle.color=white
                    frame.left=0
                    frame.right=0
                    frame.top=0
                    frame.bottom=4
                    frame.expansion=0

                    [Slider]
                    inherits=PanelButtonCommand
                    frame.element=slider
                    focusFrame=true
                    interior.element=slider
                    frame.top=3
                    frame.bottom=3
                    frame.left=3
                    frame.right=3

                    [SliderCursor]
                    inherits=PanelButtonCommand
                    frame=false
                    interior.element=slidercursor

                    [Progressbar]
                    inherits=PanelButtonCommand
                    frame.element=progress
                    interior.element=progress
                    text.margin=0
                    text.normal.color=#dfdfdf
                    text.focus.color=#dfdfdf
                    text.press.color=#dfdfdf
                    text.toggle.color=#dfdfdf
                    text.bold=false
                    frame.expansion=8

                    [ProgressbarContents]
                    inherits=PanelButtonCommand
                    frame=true
                    frame.element=progress-pattern
                    interior.element=progress-pattern

                    [ItemView]
                    inherits=PanelButtonCommand
                    text.margin=0
                    frame.element=itemview
                    interior.element=itemview
                    frame.top=2
                    frame.bottom=2
                    frame.left=2
                    frame.right=2
                    text.margin.top=2
                    text.margin.bottom=2
                    text.margin.left=4
                    text.margin.right=4
                    text.normal.color=#dfdfdf
                    text.focus.color=white
                    text.press.color=white
                    text.toggle.color=white
                    min_width=+0.3font
                    min_height=+0.3font
                    frame.expansion=0

                    [Splitter]
                    indicator.size=48

                    [Scrollbar]
                    inherits=PanelButtonCommand
                    indicator.element=arrow
                    indicator.size=12

                    [ScrollbarSlider]
                    inherits=PanelButtonCommand
                    frame.element=scrollbarslider
                    interior=false
                    frame.left=5
                    frame.right=5
                    frame.top=5
                    frame.bottom=5
                    indicator.element=grip
                    indicator.size=12

                    [ScrollbarGroove]
                    inherits=PanelButtonCommand
                    interior=false
                    frame=false

                    [Menu]
                    inherits=PanelButtonCommand
                    frame.top=10
                    frame.bottom=10
                    frame.left=10
                    frame.right=10
                    frame.element=menu
                    interior.element=menu
                    text.normal.color=#dfdfdf
                    frame.expansion=0

                    [MenuItem]
                    inherits=PanelButtonCommand
                    frame=true
                    frame.element=menuitem
                    interior.element=menuitem
                    indicator.element=menuitem
                    text.normal.color=#dfdfdf
                    text.focus.color=white
                    text.shadow=false
                    text.margin.top=0
                    text.margin.bottom=0
                    text.margin.left=8
                    text.margin.right=8
                    frame.top=4
                    frame.bottom=4
                    frame.left=4
                    frame.right=4
                    frame.expansion=0

                    [MenuBar]
                    inherits=PanelButtonCommand
                    frame.element=menubar
                    interior.element=menubar
                    frame.bottom=0
                    text.normal.color=#dfdfdf
                    text.focus.color=#ffffff
                    text.press.color=#ffffff
                    text.toggle.color=#ffffff
                    frame.expansion=0
                    text.bold=false

                    [MenuBarItem]
                    inherits=PanelButtonCommand
                    interior=true
                    interior.element=menubaritem
                    frame.element=menubaritem
                    frame.top=2
                    frame.bottom=2
                    frame.left=2
                    frame.right=2
                    text.margin.left=4
                    text.margin.right=4
                    text.margin.top=0
                    text.margin.bottom=0
                    text.normal.color=#dfdfdf
                    text.focus.color=#ffffff
                    text.press.color=#ffffff
                    text.toggle.color=#ffffff
                    text.bold=false
                    min_width=+0.3font
                    min_height=+0.3font
                    frame.expansion=0

                    [TitleBar]
                    inherits=PanelButtonCommand
                    frame=false
                    text.margin.top=2
                    text.margin.bottom=2
                    text.margin.left=2
                    text.margin.right=2
                    interior.element=titlebar
                    indicator.size=16
                    indicator.element=mdi
                    text.normal.color=#787878
                    text.focus.color=#dfdfdf
                    text.bold=false
                    text.italic=true
                    frame.expansion=0

                    [ComboBox]
                    inherits=PanelButtonCommand
                    frame.element=combo
                    interior.element=combo
                    interior=false
                    frame.top=2
                    frame.bottom=2
                    frame.left=2
                    frame.right=2
                    text.margin.top=2
                    text.margin.bottom=2
                    text.margin.left=2
                    text.margin.right=2
                    text.focus.color=white
                    text.press.color=#dfdfdf
                    text.toggle.color=white
                    frame.expansion=0

                    [GroupBox]
                    inherits=GenericFrame
                    frame=false
                    text.shadow=0
                    text.margin=0
                    text.normal.color=#dfdfdf
                    text.focus.color=white
                    text.bold=false
                    frame.expansion=0

                    [TabBarFrame]
                    inherits=GenericFrame
                    frame=true
                    frame.element=tabBarFrame
                    interior=false
                    frame.top=2
                    frame.bottom=2
                    frame.left=2
                    frame.right=2

                    [ToolTip]
                    inherits=GenericFrame
                    frame.top=6
                    frame.bottom=6
                    frame.left=6
                    frame.right=6
                    interior=true
                    text.shadow=0
                    text.margin=10
                    text.margin.top=10
                    text.margin.bottom=10
                    text.margin.left=10
                    text.margin.right=10
                    interior.element=tooltip
                    frame.element=tooltip
                    frame.expansion=0

                    [StatusBar]
                    inherits=GenericFrame
                    frame=false
                    interior=false

                    [Window]
                    interior=true
                    interior.element=window
                    frame=true
                    frame.element=window
                    frame.bottom=10
                    frame.top=10
                    " > $out/share/Kvantum/Layan/LayanDark.kvconfig
                '';
                };
            })
        ];
    };
}
