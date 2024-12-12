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
    #./vmware.nix #- STILL BROKEN in Latest Update (6.24.2024) - https://github.com/NixOS/nixpkgs/issues/310121
  ];
}
