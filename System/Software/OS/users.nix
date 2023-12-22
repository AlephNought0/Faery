{
  config,
  lib,
  pkgs,
  ...
}: {
  users.users.Aperius = {
    isNormalUser = true;
    extraGroups = ["wheel" "wireshark" "corectrl"];

    packages = with pkgs; [
      firefox
      tree
    ];
  };
}
