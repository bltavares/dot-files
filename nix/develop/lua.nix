{...}: {
  perSystem = {pkgs, ...}: {
    treefmt = {
      programs.stylua.enable = true;
    };

    devShells = {
      lua = pkgs.mkShell {
        nativeBuildInputs = [
          pkgs.lua-language-server
        ];
      };
    };
  };
}
