# /etc/nixos/system/config/default.nix

{
  ...
}: {
  imports = [
    # Dir Declarations
    ./programs
    ./udev-rules

    # File Declarations
    ./audio.nix
    ./desktop-environment.nix
    ./locale.nix
    ./networking.nix
    ./nixconfig.nix
    ./systemd.nix
  ];
}