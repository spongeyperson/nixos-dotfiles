# /etc/nixos/system/config/udev-rules/default.nix

{
  ...
}: {
  imports = [
    # File Declarations
    #./liquidctl.nix
    #./valve-controllers.nix
  ];
}