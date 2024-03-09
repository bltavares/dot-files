{self, ...}: {
  perSystem = {pkgs, ...}: let
    develop = [
      ./utils.nix

      ./nix.nix

      ./nvim.nix
      ./terminal.nix
      ./develop.nix
    ];
  in {
    legacyPackages.homeConfigurations."devcontainer" = self.nixos-flake.lib.mkHomeConfiguration pkgs ({pkgs, ...}: {
      home.stateVersion = "23.11";
      home.username = "code";
      home.homeDirectory = "/home/code";

      imports = develop;
    });

    legacyPackages.homeConfigurations."bltavares@wintermute" = self.nixos-flake.lib.mkHomeConfiguration pkgs ({pkgs, ...}: {
      home.stateVersion = "23.11";
      home.username = "bltavares";
      home.homeDirectory = "/home/bltavares";

      imports = develop;
    });

    legacyPackages.homeConfigurations."bltavares@weasel" = self.nixos-flake.lib.mkHomeConfiguration pkgs ({
      pkgs,
      config,
      ...
    }: {
      home.stateVersion = "23.11";
      home.username = "bltavares";
      home.homeDirectory = "/home/bltavares";

      imports = develop;

      #home.file.".vscode-server/server-env-setup" = ../../bin/nix-vscode-server-env-setup;
      home.file.".vscode-server-insiders/server-env-setup".source = ../../bin/nix-vscode-server-env-setup;
      home.file."repos".source = config.lib.file.mkOutOfStoreSymlink "/mnt/f/repos";
    });

    legacyPackages.homeConfigurations."bruno.tavares@nu21m1" = self.nixos-flake.lib.mkHomeConfiguration pkgs ({pkgs, ...}: {
      home.stateVersion = "23.11";
      home.username = "bruno.tavares";
      home.homeDirectory = "/Users/bruno.tavares";

      imports = develop;
    });

    packages.activate-devcontainer =
      pkgs.writeShellApplication
      {
        name = "activate-user";
        text = ''
          set -x
          nix run \
            .#homeConfigurations."devcontainer".activationPackage \
            "$@"
        '';
      };

    packages.activate-user =
      pkgs.writeShellApplication
      {
        name = "activate-user";
        text = ''
          set -x
          nix run \
            .#homeConfigurations."\"''${USER}@''${HOSTNAME}\"".activationPackage \
            "$@"
        '';
      };
  };
}
