{pkgs, ...}: {
  home.packages = [
    pkgs.direnv
  ];

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
