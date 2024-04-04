# TODO migrate all to srird/nixos-flake flake.parts
{inputs, ...}: {
  flake.nixosConfigurations.wintermute = inputs.nixpkgs-stable.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      (inputs.nixpkgs-stable + "/nixos/modules/virtualisation/lxc-container.nix")
      ./modules/remote.nix
      ./modules/develop.nix
      ./wintermute.nix
    ];
  };

  flake.nixosConfigurations.weasel = inputs.nixpkgs-stable.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      inputs.nixos-wsl.nixosModules.wsl
      ./weasel.nix
    ];
  };

  flake.darwinConfigurations.nu21m1 = inputs.nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = [
      ./modules/nix.nix
      ./modules/darwin.nix
      ./modules/darwin-linux-builder.nix
    ];
    specialArgs = {
      inherit inputs;
      system = "aarch64-darwin";
    };
  };
}
