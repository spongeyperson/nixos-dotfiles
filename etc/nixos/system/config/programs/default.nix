# /etc/nixos/system/config/programs/default.nix
# Program Configuration Import

{
  ...
}: {
  imports = [
    # File Declarations
    ./coolercontrol.nix
    ./fish.nix
    ./liquidctl.nix
    ./openrgb.nix
    ./programs.nix
    ./steam.nix
  ];
}
