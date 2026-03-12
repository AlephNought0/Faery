{
  boot = {
    supportedFilesystems = ["zfs"];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };
  };
}
