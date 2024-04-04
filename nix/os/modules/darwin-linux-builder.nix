# Bootstrapping this is a bit tricky, as we need to build the darwin-builder in Linux.
# We first must run `nix run nixpkgs#darwin.linux-builder` to get a Linux Builder, an configure a few files
# As documented on https://nixos.org/manual/nixpkgs/stable/#sec-darwin-builder
{
  inputs,
  system,
  ...
}: let
  inherit (inputs) nixpkgs;
  pkgs = nixpkgs.legacyPackages."${system}";
  linuxSystem = builtins.replaceStrings ["darwin"] ["linux"] system;

  darwin-builder = nixpkgs.lib.nixosSystem {
    system = linuxSystem;
    modules = [
      "${nixpkgs}/nixos/modules/profiles/macos-builder.nix"
      {
        nix = {
          nixPath = ["nixpkgs=${inputs.nixpkgs}"];
          registry.nixpkgs.flake = inputs.nixpkgs;
          gc = {
            automatic = true;
            dates = "hourly";
            persistent = false;
          };
        };

        boot.binfmt.emulatedSystems = ["x86_64-linux"];
        virtualisation = {
          host.pkgs = pkgs;
          darwin-builder.workingDirectory = "/var/lib/darwin-builder";
          darwin-builder.hostPort = 22;
        };
      }
    ];
  };
in {
  nix = {
    settings.builders-use-substitutes = true;
    distributedBuilds = true;
    buildMachines = [
      {
        sshUser = "builder";
        hostName = "linux-builder";
        systems = [
          linuxSystem
          "x86_64-linux"
        ];
        maxJobs = 4;
        supportedFeatures = ["kvm" "benchmark" "big-parallel"];
        sshKey = "/etc/nix/builder_ed25519";
        protocol = "ssh-ng";
      }
    ];
  };

  environment.etc."ssh/ssh_config.d/100-linux-builder.conf".text = ''
    Host linux-builder
      Hostname localhost
      HostKeyAlias linux-builder
      Port 22
  '';

  launchd.daemons.darwin-builder = {
    command = "${darwin-builder.config.system.build.macos-builder-installer}/bin/create-builder";
    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = false;
      StandardOutPath = "/var/log/darwin-builder.log";
      StandardErrorPath = "/var/log/darwin-builder.log";
      EnvironmentVariables = {
        "NIX_SSL_CERT_FILE" = "/etc/ssl/certs/ca-certificates.crt";
      };
    };
  };
}
