{ config, lib, pkgs, ... }:
let
    inherit (lib) mkEnableOption mkIf;
    inherit (config.faery.system) username;

    cfg = config.faery.programs.opentablet;
in
{
    options.faery.programs.opentablet = {
        enable = mkEnableOption "opentablet module.";
    };

    config = mkIf cfg.enable {
        hardware.opentabletdriver = {
            enable = true;
            daemon.enable = true;
            package = pkgs.opentabletdriver;
        };

        home-manager.users.${username}.xdg.configFile."OpenTabletDriver/settings.json".text = builtins.toJSON {
            Profiles = [
            {
                Tablet = "XP-Pen Deco 01 V2 (variant 2)";
                OutputMode = {
                Path = "OpenTabletDriver.Desktop.Output.LinuxArtistMode";
                Settings = [];
                Enable = true;
                };
                Filters = [];
                AbsoluteModeSettings = {
                Display = {
                    Width = 1280.0;
                    Height = 720.0;
                    X = 640.0;
                    Y = 360.0;
                    Rotation = 0.0;
                };
                Tablet = {
                    Width = 254.0;
                    Height = 158.75;
                    X = 127.0;
                    Y = 79.375;
                    Rotation = 0.0;
                };
                EnableClipping = true;
                EnableAreaLimiting = false;
                LockAspectRatio = false;
                };
                RelativeModeSettings = {
                XSensitivity = 10.0;
                YSensitivity = 10.0;
                RelativeRotation = 0.0;
                RelativeResetDelay = "00:00:00.1000000";
                };
                Bindings = {
                TipActivationThreshold = 0.0;
                TipButton = {
                    Path = "OpenTabletDriver.Desktop.Binding.MouseBinding";
                    Settings = [
                    {
                        Property = "Button";
                        Value = "Left";
                    }
                    ];
                    Enable = true;
                };
                EraserActivationThreshold = 0.0;
                EraserButton = null;
                PenButtons = [
                    {
                    Path = "OpenTabletDriver.Desktop.Binding.MouseBinding";
                    Settings = [
                        {
                        Property = "Button";
                        Value = "Right";
                        }
                    ];
                    Enable = true;
                    }
                    {
                    Path = "OpenTabletDriver.Desktop.Binding.KeyBinding";
                    Settings = [
                        {
                        Property = "Key";
                        Value = "E";
                        }
                    ];
                    Enable = true;
                    }
                ];
                AuxButtons = [
                    {
                    Path = "OpenTabletDriver.Desktop.Binding.KeyBinding";
                    Settings = [
                        {
                        Property = "Key";
                        Value = "B";
                        }
                    ];
                    Enable = true;
                    }
                    {
                    Path = "OpenTabletDriver.Desktop.Binding.MultiKeyBinding";
                    Settings = [
                        {
                        Property = "Keys";
                        Value = "Control+T";
                        }
                    ];
                    Enable = true;
                    }
                    {
                    Path = "OpenTabletDriver.Desktop.Binding.KeyBinding";
                    Settings = [
                        {
                        Property = "Key";
                        Value = "Space";
                        }
                    ];
                    Enable = true;
                    }
                    {
                    Path = "OpenTabletDriver.Desktop.Binding.MultiKeyBinding";
                    Settings = [
                        {
                        Property = "Keys";
                        Value = "Control+Z";
                        }
                    ];
                    Enable = true;
                    }
                    {
                    Path = "OpenTabletDriver.Desktop.Binding.KeyBinding";
                    Settings = [
                        {
                        Property = "Key";
                        Value = "D6";
                        }
                    ];
                    Enable = true;
                    }
                    {
                    Path = "OpenTabletDriver.Desktop.Binding.KeyBinding";
                    Settings = [
                        {
                        Property = "Key";
                        Value = "D4";
                        }
                    ];
                    Enable = true;
                    }
                    {
                    Path = "OpenTabletDriver.Desktop.Binding.MultiKeyBinding";
                    Settings = [
                        {
                        Property = "Keys";
                        Value = "Control+Alt+M";
                        }
                    ];
                    Enable = true;
                    }
                    {
                    Path = "OpenTabletDriver.Desktop.Binding.KeyBinding";
                    Settings = [
                        {
                        Property = "Key";
                        Value = "M";
                        }
                    ];
                    Enable = true;
                    }
                ];
                MouseButtons = [];
                MouseScrollUp = null;
                MouseScrollDown = null;
                };
            }];
            LockUsableAreaDisplay = true;
            LockUsableAreaTablet = true;
            Tools = [];
        };
    };
}
