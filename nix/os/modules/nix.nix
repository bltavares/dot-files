{
  inputs,
  pkgs,
  ...
}: {
  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    registry.nixpkgs.flake = inputs.nixpkgs;

    settings = {
      experimental-features = ["nix-command" "flakes"];
      extra-substituters = [
        "https://nix-community.cachix.org"
        "https://cache.garnix.io"
      ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];
      bash-prompt-prefix = "($name) ";

      extra-trusted-users = ["@admin" "@wheel"];
      trusted-users = ["root"];
    };
  };

  # Minimal flake dependencies + some editor
  environment.systemPackages = with pkgs; [
    git
    curl
    vim
  ];
}
