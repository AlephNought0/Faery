{
  config,
  lib,
  pkgs,
  inputs,
  osConfig,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = inputs.firefox-nightly.packages."${pkgs.system}".firefox-nightly-bin;

    preferences = {
      "media.ffmpeg.vaapi.enabled" = true;
      "media.ffvpx.enabled" = false;
      "media.av1.enabled" = false;
      "gfx.webrender.all" = true;
      "widget.wayland.fractional-scale.enabled" = true;
    };
  };
}
