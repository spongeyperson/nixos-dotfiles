# /etc/nixos/system/config/programs/default.nix
# Program Configuration Import

{
  ...
}: {
  imports = [
    # File Declarations
    ./fish.nix
    ./liquidctl.nix
    ./openrgb.nix
    ./programs.nix
    ./steam.nix
  ];
}
