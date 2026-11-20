{
  config = {
    programs.foot = {
      enable = true;

      settings = {
        main = {
          font = "JetBrainsMono NerdFont:size=12";
        };

        colors-dark = {
          alpha = 0.7;
          background = "000000";
        };
      };
    };
  };
}
