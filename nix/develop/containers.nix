{...}: {
  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    devShells = {
      containers = pkgs.mkShell {
        name = "containers";
        nativeBuildInputs = [
          pkgs.dive
          inputs'.bltavares-nixpkgs.legacyPackages.aws-env
        ];
      };
    };
  };
}
