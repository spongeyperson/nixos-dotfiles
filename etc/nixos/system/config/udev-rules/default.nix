# /etc/nixos/system/config/udev-rules/default.nix

{
  ...
}: {
  imports = [
    # File Declarations
    ./50-removeable-cache.nix
    #./liquidctl.nix
    #./valve-controllers.nix
  ];
}