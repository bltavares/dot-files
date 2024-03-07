{inputs, ...}: {
  flake.nixosConfigurations.wintermute = inputs.nixpkgs-stable.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [./wintermute.nix];
  };

  flake.nixosConfigurations.weasel = inputs.nixpkgs-stable.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      inputs.nixos-wsl.nixosModules.wsl
      ./weasel.nix
    ];
  };
}
