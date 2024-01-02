# /etc/nixos/system/services/default.nix
# System Configuration Import

{
  ...
}: {
  imports = [
    # File Declarations
    ./services.nix
    ./udev-rules.nix
  ];
}
