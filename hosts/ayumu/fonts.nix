{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      liberation_ttf
    ];

    fontconfig = {
      enable = true;
      antialias = true;
      subpixel.rgba = "rgb";

      hinting = {
        enable = true;
        style = "slight";
      };
    };
  };
}
