{...}: {
  perSystem = {pkgs, ...}: {
    devShells = {
      bash = pkgs.mkShell {
        name = "bash";
        nativeBuildInputs = [
          pkgs.shfmt
          pkgs.shellcheck
        ];
      };
    };
  };
}
