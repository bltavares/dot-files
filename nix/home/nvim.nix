{
  pkgs,
  config,
  ...
}: {
  home.packages = [
    pkgs.neovim
    pkgs.clang # for treesitter
  ];

  xdg.configFile."nvim".source = config.lib.mine.mkLink config "nvim";
}
