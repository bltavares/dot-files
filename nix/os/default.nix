{inputs, ...}: {
  flake.nixosConfigurations.wintermute = inputs.nixpkgs-stable.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      (inputs.nixpkgs-stable + "/nixos/modules/virtualisation/lxc-container.nix")
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
}
