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
  programs.zellij.enable = true;
  programs.ripgrep.enable = true;

  home.packages = [
    pkgs.jq
    pkgs.jless
    pkgs.zenith
    pkgs.gnumake
    pkgs.mmake
  ];
}
