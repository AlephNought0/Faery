{
  osConfig,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = osConfig.faery.kdeWithoutPlasma;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # Will add more packages if I find out there are some apps that do not work.
      kdePackages.ffmpegthumbs
      kdePackages.qtwayland
      kdePackages.qtsvg
      kdePackages.kiconthemes
      kdePackages.kdf
      kdePackages.kio-extras
      kdePackages.kio-admin
      kdePackages.plasma-integration
      kdePackages.kdegraphics-thumbnailers
      kdePackages.kservice
      kdePackages.kfind
      kdePackages.kdbusaddons
      kdePackages.kfilemetadata
      kdePackages.kconfig
      kdePackages.kcoreaddons
      kdePackages.kguiaddons
      kdePackages.ki18n
      kdePackages.kitemviews
      kdePackages.kwidgetsaddons
      kdePackages.kwindowsystem
      kdePackages.ark
      unrar # Not really a kde package but it makes ark able to extract rar files so might as well put it here.
    ];

    #environment.etc."xdg/menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

    xdg.configFile."menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
  };
}
