{...}: {
  perSystem = {pkgs, ...}: {
    devShells = {
      go = pkgs.mkShell {
        name = "go";
        nativeBuildInputs = [
          pkgs.go
        ];
      };
    };
  };
}
