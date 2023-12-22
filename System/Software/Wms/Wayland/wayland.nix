{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    xwaylandvideobridge
  ];

  programs.xwayland.enable = true;
}
