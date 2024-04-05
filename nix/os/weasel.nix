{...}: let
  hostname = "weasel";
  user = "bltavares";
  timeZone = "America/Sao_Paulo";
  defaultLocale = "en_US.UTF-8";
in {
  system.stateVersion = "23.11";

  networking.hostName = hostname;
  time.timeZone = timeZone;
  i18n.defaultLocale = defaultLocale;

  wsl.enable = true;
  wsl.defaultUser = user;
}
