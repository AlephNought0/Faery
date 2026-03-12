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
      exec = "gamescope -W 2560 -H 1440 -r 180 -f --backend sdl --expose-wayland --force-grab-cursor -- flatpak run --file-forwarding org.vinegarhq.Vinegar";
      icon = "org.vinegarhq.vinegar";
      terminal = false;
      type = "Application";
    };

    "ContentManager" = {
      name = "Content Manager";
      exec = "steam -applaunch 244210 %U";
      terminal = false;
      type = "Application";
      mimeType = ["x-scheme-handler/acmanager"];
      icon = "steam_icon_244210";
      categories = ["Game"];
    };
  };
}
