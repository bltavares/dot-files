{...}: let
  hostname = "wintermute";
  # TODO defaults
  timeZone = "America/Sao_Paulo";
  defaultLocale = "en_US.UTF-8";
in {
  system.stateVersion = "23.11";

  networking.hostName = hostname;
  time.timeZone = timeZone;
  i18n.defaultLocale = defaultLocale;

  # Supress systemd units that don't work because of LXC.
  # https://blog.xirion.net/posts/nixos-proxmox-lxc/#configurationnix-tweak
  systemd.suppressedSystemUnits = [
    "dev-mqueue.mount"
    "sys-kernel-debug.mount"
    "sys-fs-fuse-connections.mount"
  ];
}
