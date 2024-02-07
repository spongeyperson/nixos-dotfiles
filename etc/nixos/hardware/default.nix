# /etc/nixos/hardware/default.nix
# Hardware Configuration Import

{
  ...
}: {
  imports = [
    # Dir Declarations
    ./peripherials

    # File Declarations
    ./bluetooth.nix
    ./cpu.nix
    ./gpu.nix
  ];
}