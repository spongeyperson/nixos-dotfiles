# /etc/nixos/virtualisation/default.nix
# Virtualisation Configuration Import

{
  ...
}: {
  imports = [
    # File Declarations
    ./docker.nix
    ./podman.nix
    ./vfio.nix
    ./vmware.nix
  ];
}