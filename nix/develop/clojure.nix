{...}: {
  perSystem = {pkgs, ...}: let
    jdk = pkgs.jdk21_headless;
    clojure = pkgs.clojure.override {
      inherit jdk;
    };
  in {
    devShells = {
      clojure = pkgs.mkShell {
        name = "clojure";
        nativeBuildInputs = [
          clojure
          jdk
          pkgs.clojure-lsp
        ];
      };
    };
  };
}
