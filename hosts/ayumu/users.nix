{pkgs, ...}: {
  users = {
    groups.storage = {};

    users.Aperius = {
      isNormalUser = true;
      shell = pkgs.zsh;
      createHome = true;
      home = "/home/Aperius";
      extraGroups = [
        "wheel"
        "audio"
        "video"
        "libvirtd"
        "storage"
      ];
    };
  };
}
