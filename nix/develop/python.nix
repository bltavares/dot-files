{...}: {
  perSystem = {pkgs, ...}: {
    devShells = {
      python = pkgs.mkShell {
        name = "python";
        nativeBuildInputs = [
          pkgs.uv
          pkgs.python3
        ];
      };
    };
  };
}
