{pkgs, ...}: let
  # TODO make it an option
  user = "bltavares";
in {
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
}
