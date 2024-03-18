{...}: {
  perSystem = {pkgs, ...}: {
    devShells = {
      go = pkgs.mkShell {
        name = "go";
        nativeBuildInputs = [
          pkgs.go
          pkgs.gopls
          pkgs.go-tools
          pkgs.delve
        ];
      };
    };
  };
}
