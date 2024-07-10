{ config, lib, ... }:
{
    boot = {
        loader = {
            systemd-boot = {
                enable = true;
                memtest86.enable = true;
                configurationLimit = 30;
            };

            #efi.efiSysMountPoint = "/boot";
            efi.canTouchEfiVariables = true;
        };

        plymouth = {
            enable = true;
        };

        initrd.systemd.enable = true;
    };
}
