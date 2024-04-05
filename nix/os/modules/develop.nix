{pkgs, ...}: {
  # TODO Docker

  # TODO qemu-user-static support (for NixOS)
  boot.binfmt.emulatedSystems =
    if pkgs.stdenv.isAarch64
    then ["x86_64-linux"]
    else ["aarch64-linux"];
}
