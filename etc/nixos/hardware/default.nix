# /etc/nixos/hardware/default.nix
# Hardware Configuration Import

{
  ...
}: {
  imports = [
    # Dir Declarations
    ./device-specific

    # File Declarations
    ./bluetooth.nix
    ./cpu.nix
    ./gpu.nix
  ];
}