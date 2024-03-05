{...}: {
  perSystem = {pkgs, ...}: {
    devShells = {
      lua = pkgs.mkShell {
        name = "lua";
        nativeBuildInputs = [
          pkgs.lua-language-server
          pkgs.stylua
        ];
      };
    };
  };
}
