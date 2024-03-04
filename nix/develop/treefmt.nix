{...}: {
  perSystem = {
    config,
    lib,
    pkgs,
    ...
  }: {
    treefmt = {
      projectRootFile = "flake.nix";

      programs.alejandra.enable = true;
      programs.stylua.enable = true;
    };

    devShells.treefmt = pkgs.mkShell {
      name = "treefmt";
      nativeBuildInputs =
        [
          config.treefmt.build.wrapper
        ] ++ lib.attrValues config.treefmt.build.programs;
    };
  };
}
