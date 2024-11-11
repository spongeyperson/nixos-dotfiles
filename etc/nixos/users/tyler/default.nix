# /etc/nixos/user/tyler/default.nix

{
  ...
}: {
  imports = [
    # Folder Declarations
    ./userconfs
    # File Declarations
    ./tyler.nix
    ./userPackages.nix
  ];
}
