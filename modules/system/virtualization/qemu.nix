{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.faery.virtualization.qemu;
in {
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      qemu
      qemu_kvm
    ];

    programs.virt-manager.enable = true;

    virtualisation = {
      libvirtd = {
        enable = true;
        onBoot = "ignore";
        onShutdown = "shutdown";

        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = false;
        };
      };
    };

    networking.firewall.trustedInterfaces = ["virbr0" "br0"];

    systemd.tmpfiles.rules = ["L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware"];
  };
}
