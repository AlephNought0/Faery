{
  xdg.desktopEntries = {
    # I want that war thunder fr
    war-thunder = {
      name = "War Thunder";
      exec = "steam-run /home/Aperius/Desktop/stuff/Games/WarThunder/launcher";
      icon = "/home/Aperius/Desktop/stuff/Games/WarThunder/launcher.ico";
      categories = ["Application"];
    };

    "Vinegar" = {
      name = "Vinegar";
      genericName = "Sigma Ohio Launcher";
      comment = "Run Roblox Studio on Linux";
      exec = "gamescope -w 2560 -h 1440 -r 165 --force-grab-cursor --mouse-sensitivity 3 --backend sdl -- flatpak run --file-forwarding org.vinegarhq.Vinegar";
      icon = "org.vinegarhq.vinegar";
      terminal = false;
      type = "Application";
    };
  };
}
