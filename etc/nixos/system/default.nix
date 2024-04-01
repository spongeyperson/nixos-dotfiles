# /etc/nixos/system/default.nix
# System Configuration Import

{
  ...
}: {
  imports = [
    # Dir Declarations
    ./boot
    ./config
    ./services

    # File Declarations
    ./systemPackages.nix
  ];
}
