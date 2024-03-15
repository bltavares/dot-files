{
  config,
  flake,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;

  home.file.".zsh".source = config.lib.mine.mkLink config "zsh";
  home.file.".zshrc".source = config.lib.mine.mkLink config "zsh/zshrc";
  home.file.".oh-my-zsh".source = flake.inputs.oh-my-zsh;
  home.file.".git_prompt.sh".source = flake.inputs.git-prompt;

  programs.zoxide.enable = true;
  programs.eza.enable = true;
  programs.atuin.enable = true;
  programs.ripgrep.enable = true;
  programs.bat.enable = true;
  programs.bottom.enable = true;
  programs.fzf.enable = true;

  home.packages = [
    pkgs.jq
    pkgs.jless
    pkgs.zenith
    pkgs.gnumake
    pkgs.mmake
    pkgs.moreutils
  ];

  programs.zellij.enable = true;
  xdg.configFile."zellij".source = config.lib.mine.mkLink config "zellij";
}
