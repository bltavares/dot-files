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
          pkgs.bacon
          pkgs.cargo-nextest
          pkgs.cargo-udeps
          pkgs.cargo-watch
          pkgs.rust-analyzer
          pkgs.systemfd
        ];
      };
    };
  };
}
