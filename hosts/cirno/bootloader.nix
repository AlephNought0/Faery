{
  boot = {
    supportedFilesystems = ["xfs"];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };
  };
}
