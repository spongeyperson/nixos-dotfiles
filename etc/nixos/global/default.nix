# /etc/nixos/global/default.nix

# This Configuration File is a bridge file that links the following imports together.
# Modify this configuration only if you want to EXCLUDE a specific config.

{
  modulesPath,
  ...
}: {
  imports = [
    # Dir Declarations
    #./custom-configs
    ./system
    #./user
    
    # File Declarations
    ./nix.nix
  ];
}
