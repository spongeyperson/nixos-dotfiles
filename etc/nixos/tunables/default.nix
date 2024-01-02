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
    ./packages
    ./personalisation
    
    # File Declarations
    #./global-vars.nix - Doesn't need to be imported, as it is imported by various files that require this file.
    ./user.nix
  ];
}
