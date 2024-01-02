# /etc/nixos/hardware/default.nix
# Hardware Configuration Import

{
  ...
}: {
  imports = [
    # File Declarations
    ./rog-g513qy.nix
  ];
}
