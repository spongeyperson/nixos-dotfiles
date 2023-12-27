# /etc/nixos/global/system/default.nix

# This Configuration File is a bridge file that links the following imports together.
# Modify this configuration only if you want to EXCLUDE a specific config.

{
  modulesPath,
  ...
}: {
  imports = [
    # Dir Declarations
    ./bootloader
    ./hardware
    #./virtualisation

    # File Declarations
    ./services.nix
    ./udev-rules.nix
  ];
}
