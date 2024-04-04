{...}: {
  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    devShells = {
      infra = pkgs.mkShell {
        name = "infra";
        nativeBuildInputs = [
          pkgs.packer
          pkgs.pulumi
          inputs'.bltavares-nixpkgs.legacyPackages.aws-env
        ];
      };
    };
  };
}
