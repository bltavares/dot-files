{...}: {
  perSystem = {pkgs, ...}: {
    devShells = {
      containers = pkgs.mkShell {
        name = "containers";
        nativeBuildInputs = [
          pkgs.dive
        ];
      };
    };
  };
}
