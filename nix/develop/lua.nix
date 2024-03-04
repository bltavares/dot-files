{...}: {
  perSystem = {pkgs, ...}: {
    treefmt = {
      programs.stylua.enable = true;
    };

    devShells = {
      lua = pkgs.mkShell {
        name = "lua";
        nativeBuildInputs = [
          pkgs.lua-language-server
        ];
      };
    };
  };
}
