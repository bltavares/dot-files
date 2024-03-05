{
  imports = [
    ./nix.nix
    ./rust.nix
    ./lua.nix
    ./clojure.nix
    ./treefmt.nix
  ];

  perSystem = {
    pkgs,
    config,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "dotfiles";
      inputsFrom = [config.devShells.nix config.devShells.lua config.devShells.treefmt];
    };
  };
}
