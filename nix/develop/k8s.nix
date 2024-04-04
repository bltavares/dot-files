{...}: {
  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    devShells = {
      k8s = pkgs.mkShell {
        name = "k8s";
        nativeBuildInputs = [
          inputs'.bltavares-nixpkgs.legacyPackages.aws-env
          pkgs.kubernetes-helm
          pkgs.istioctl
        ];
      };
    };
  };
}
