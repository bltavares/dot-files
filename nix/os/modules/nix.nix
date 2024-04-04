{inputs, ...}: {
  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    registry.nixpkgs.flake = inputs.nixpkgs;

    settings = {
      experimental-features = ["nix-command" "flakes"];
      extra-substituters = [
        "https://nix-community.cachix.org"
      ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      bash-prompt-prefix = "($name) ";

      extra-trusted-users = ["@admin" "@wheel"];
      trusted-users = ["root"];
    };
  };
}
