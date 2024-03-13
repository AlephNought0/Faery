{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}: {
  home-manager.users.Aperius.home.packages = with pkgs; [
    (element-desktop.overrideAttrs {
      postFixup = ''
        makeWrapper '${electron}/bin/electron' "$out/bin/element-desktop" \
          --set LD_PRELOAD ${sqlcipher}/lib/libsqlcipher.so \
          --add-flags "$out/share/element/electron" \
          --add-flags "--ozone-platform=wayland --enable-zero-copy --use-gl=angle --use-vulkan --use-angle=vulkan --disable-reading-from-canvas --enable-oop-rasterization --enable-raw-draw --enable-gpu-rasterization --enable-gpu-compositing --enable-native-gpu-memory-buffers --enable-accelerated-2d-canvas --enable-accelerated-video-decode --enable-accelerated-mjpeg-decode --disable-gpu-vsync --enable-features=Vulkan,VulkanFromANGLE,DefaultANGLEVulkan,VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport"
      ''; # Vulkan stuff is left here because we want to make --use-angle=vulkan work.
    })
  ];
}
