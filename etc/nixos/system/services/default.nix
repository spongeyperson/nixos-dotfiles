# /etc/nixos/system/services/default.nix
# System Configuration Import

{
  ...
}: {
  imports = [
    # File Declarations
    ./flatpak.nix
    ./services.nix
  ];
}
