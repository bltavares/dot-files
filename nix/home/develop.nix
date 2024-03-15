{pkgs, ...}: {
  programs.gh.enable = true;
  programs.gh-dash.enable = true;

  home.packages = with pkgs; [
    jq
    jless
    gnumake
    mmake
  ];
}
