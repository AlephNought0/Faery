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
      peripheralFirmwareDirectory = ./firmware;
    };
  };
}
