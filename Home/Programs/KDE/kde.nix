{
  config,
  lib,
  pkgs,
  ...
}: {
  services.desktopManager.plasma6 = {
    enable = true;

    excludePackages = with kdePackages; [
      kwallet
      kwallet-pam
      kwalletmanager
    ];
  };
}
