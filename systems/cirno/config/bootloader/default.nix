{ config, lib, ... }:
{
    boot.loader = {
        systemd-boot = {
            enable = true;
            memtest86.enable = true;
        };

        #efi.efiSysMountPoint = "/boot";
        efi.canTouchEfiVariables = true;
    };
}
