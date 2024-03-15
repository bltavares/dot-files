{...}: {
  perSystem = {pkgs, ...}: {
    devShells = {
      infra = pkgs.mkShell {
        name = "infra";
        nativeBuildInputs = [
          pkgs.packer
          pkgs.pulumi
          pkgs.aws-env
        ];
      };
    };
  };
}
