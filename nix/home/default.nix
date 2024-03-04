{self, ...}: {
  perSystem = {pkgs, ...}: let
    develop = [
      ./utils.nix

      ./nix.nix

      ./nvim.nix
      ./terminal.nix
    ];
  in {
    legacyPackages.homeConfigurations."devcontainer" = self.nixos-flake.lib.mkHomeConfiguration pkgs ({pkgs, ...}: {
      imports = develop;
      home.stateVersion = "23.11";
      home.username = "code";
      home.homeDirectory = "/home/code";
    });

    legacyPackages.homeConfigurations."nixos@nixos" = self.nixos-flake.lib.mkHomeConfiguration pkgs ({pkgs, ...}: {
      imports =
        develop
        ++ [
          ./hosts/ct.nix
        ];
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
