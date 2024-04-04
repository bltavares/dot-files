{
  imports = [
    ./nix.nix
    ./rust.nix
    ./lua.nix
    ./bash.nix
    ./clojure.nix
    ./wasm.nix
    ./containers.nix
    ./k8s.nix
    ./go.nix
    ./treefmt.nix
  ];

  perSystem = {
    pkgs,
    config,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "dotfiles";
      inputsFrom = [
        config.devShells.nix
        config.devShells.lua
        config.devShells.bash
        config.devShells.treefmt
      ];
    };
  };
}
