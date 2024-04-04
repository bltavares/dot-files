{...}: {
  perSystem = {
    config,
    lib,
    pkgs,
    ...
  }: {
    treefmt = {
      projectRootFile = "flake.nix";
      programs.stylua.enable = true;
      programs.alejandra.enable = true;
      # programs.shfmt.enable = true;
      # programs.shellcheck.enable = true;
    };

    devShells.treefmt = pkgs.mkShell {
      name = "treefmt";
      nativeBuildInputs =
        [
          config.treefmt.build.wrapper
        ]
        ++ lib.attrValues config.treefmt.build.programs;
    };
  };
}
