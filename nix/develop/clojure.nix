{...}: {
  perSystem = {pkgs, ...}: let
    mkWithJdk = jdk: let
      clojure = pkgs.clojure.override {
        inherit jdk;
      };
    in
      pkgs.mkShell {
        name = "clojure-${jdk.version}";
        nativeBuildInputs = [
          clojure
          jdk

          pkgs.clojure-lsp
          pkgs.clj-kondo
        ];
      };
  in {
    devShells = rec {
      clojure = clojure_21;
      clojure_21 = mkWithJdk pkgs.jdk21_headless;
      clojure_11 = mkWithJdk pkgs.jdk11_headless;
    };
  };
}
