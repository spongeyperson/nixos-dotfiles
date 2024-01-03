# /etc/nixos/hardware/default.nix
# Hardware Configuration Import

{
  ...
}: {
  imports = [
    # File Declarations
    ./bluetooth.nix
    ./cpu.nix
    ./gpu.nix
  ];
}