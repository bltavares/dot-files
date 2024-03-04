{
  imports = [
    ./nix.nix
    ./rust.nix
    ./lua.nix
    ./treefmt.nix
  ];

  perSystem = {
    pkgs,
    config,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      inputsFrom = [config.devShells.nix config.devShells.lua config.devShells.treefmt];
    };
  };
}
