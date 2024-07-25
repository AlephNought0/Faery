{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    fontconfig.enable = true;
    packages = with pkgs; [
      jetbrains-mono
      nerdfonts
    ];
  };
}
