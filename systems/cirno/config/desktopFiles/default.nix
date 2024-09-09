{config, ...}: let
  inherit (config.faery.system) username;
in {
  home-manager.users."${username}".xdg.desktopEntries = {
    war-thunder = {
      name = "War Thunder";
      exec = "steam-run /home/Aperius/Desktop/stuff/Games/WarThunder/launcher";
      icon = "/home/Aperius/Desktop/stuff/Games/WarThunder/launcher.ico";
      categories = ["Application"];
    };
  };
}
