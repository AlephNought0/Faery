{
  config,
  lib,
  pkgs,
  ...
}: {
  time.timeZone = "Europe/Bratislava";

  i18n.defaultLocale = "en_US.UTF-8";
}
