{pkgs, ...}: let
  hostname = "wintermute";
  user = "bltavares";
  timeZone = "America/Sao_Paulo";
  defaultLocale = "en_US.UTF-8";
in {
  system.stateVersion = "23.11";
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    bash-prompt-prefix = "($name) ";
  };

  networking.hostName = hostname;
  time.timeZone = timeZone;
  i18n.defaultLocale = defaultLocale;

  environment.systemPackages = with pkgs; [
    git
    curl
    vim
  ];
  programs.zsh.enable = true;

  users = {
    users."${user}" = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      initialPassword = "nixos";
      shell = pkgs.zsh;
    };
  };

  # Enable passwordless sudo.
  security.sudo.extraRules = [
    {
      users = [user];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];

  # Supress systemd units that don't work because of LXC.
  # https://blog.xirion.net/posts/nixos-proxmox-lxc/#configurationnix-tweak
  systemd.suppressedSystemUnits = [
    "dev-mqueue.mount"
    "sys-kernel-debug.mount"
    "sys-fs-fuse-connections.mount"
  ];
}
