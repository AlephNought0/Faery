{
    boot = {
        loader = {
            systemd-boot = {
                enable = true;
                memtest86.enable = true;
                configurationLimit = 30;
            };

            efi.canTouchEfiVariables = true;
        };
    };
}
