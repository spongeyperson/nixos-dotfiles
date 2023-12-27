# /etc/nixos/tunables/default.nix

# This Configuration File is a bridge file that links the following imports together.
# Modify this configuration only if you want to EXCLUDE a specific config.

{
  modulesPath,
  ...
}: {
  imports = [
    # Dir Declarations
    ./hardware-specific
    ./programs
    # File Declarations
    ./desktop-environment.nix
    ./global-vars.nix
    ./user.nix
  ];
}
