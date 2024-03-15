{...}: {
  perSystem = {pkgs, ...}: {
    devShells = {
      k8s = pkgs.mkShell {
        name = "k8s";
        nativeBuildInputs = [
          pkgs.kubernetes-helm
          pkgs.istioctl
        ];
      };
    };
  };
}
