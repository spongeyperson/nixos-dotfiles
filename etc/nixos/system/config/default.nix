# /etc/nixos/system/config/default.nix

{
  ...
}: {
  imports = [
    # Dir Declarations
    ./programs

    # File Declarations
    ./audio.nix
    ./desktop-environment.nix
    ./locale.nix
    ./networking.nix
    ./nixconfig.nix
    ./systemd.nix
  ];
}