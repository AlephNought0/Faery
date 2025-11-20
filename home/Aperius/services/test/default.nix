{pkgs, ...}: {
  systemd.user.services.test = {
    Unit.After = ["dbus.service"];
    Service = {
      ExecStart = pkgs.writeShellScript "test" ''
        mkdir $HOME/test
        echo "Made directory"
      '';
      Restart = "on-failure";
    };
    Install.WantedBy = ["dbus.service"];
  };
}
