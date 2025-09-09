{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.faery.system) username;

  cfg = config.faery.programs.qemu;
in {
  options.faery.programs.qemu = {
    enable = mkEnableOption "qemu module.";
  };

  config = mkIf cfg.enable {
    home-manager.users.${username}.home.packages = with pkgs; [
      qemu
    ];

    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };

    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = ["${username}"];
    systemd.tmpfiles.rules = ["L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware"];
  };
}
