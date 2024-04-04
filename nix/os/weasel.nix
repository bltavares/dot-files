{pkgs, ...}: let
  hostname = "weasel";
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

  wsl.enable = true;
  wsl.defaultUser = user;

  environment.systemPackages = with pkgs; [
    git
    curl
    vim
  ];

  users = {
    users."${user}" = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      initialPassword = "nixos";
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
}
