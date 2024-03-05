{...}: {
  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    devShells = {
      rust = pkgs.mkShell {
        name = "rust";
        nativeBuildInputs = [
          (inputs'.fenix.packages.stable.withComponents [
            "cargo"
            "clippy"
            "rust-src"
            "rustc"
            "rustfmt"
          ])
          pkgs.rust-analyzer
        ];
      };
    };
  };
}
