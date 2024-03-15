{...}: {
  perSystem = {pkgs, ...}: {
    devShells = {
      wasm = pkgs.mkShell {
        name = "wasm";
        nativeBuildInputs = [
          pkgs.binaryen
          pkgs.wasm-pack
          pkgs.wasm-tools
          pkgs.wasm-bindgen-cli
        ];
      };
    };
  };
}
