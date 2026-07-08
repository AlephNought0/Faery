{
  lib,
  pkgs,
  ...
}: {
  # For now I will put stuff in this file. Once it starts getting bigger I will properly organize this
  hardware = {
    graphics.enable32Bit = lib.mkForce false;

    apple = {
      touchBar = {
        enable = true;
        package = pkgs.tiny-dfr;
      };
    };

    asahi = {
      enable = true;
      peripheralFirmwareDirectory = builtins.fetchGit {
        url = "git@github.com:AlephNought0/macbook-asahi-firmware.git";
        rev = "3b1215567ddc014bf416e9fcde786b2bc8de7a5b";
      };
    };
  };
}
