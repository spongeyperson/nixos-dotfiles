# /etc/nixos/hardware/default.nix
# Hardware Configuration Import

{
  ...
}: {
  imports = [
    # Dir Declarations
    ./device-specific
    ./peripherials

    # File Declarations
    ./bluetooth.nix
    ./cpu.nix
    ./gpu.nix
  ];
}