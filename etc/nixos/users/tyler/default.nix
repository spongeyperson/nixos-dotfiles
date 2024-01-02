# /etc/nixos/user/tyler/default.nix

{
  ...
}: {
  imports = [
    # File Declarations
    ./tyler.nix
    ./userPackages.nix
  ];
}
