# /etc/nixos/tunables/personalisation/default.nix

# This Configuration File is a bridge file that links the following imports together.
# Modify this configuration only if you want to EXCLUDE a specific config.

{
  modulesPath,
  ...
}: {
  imports = [
    # File Declarations
    ./kdeplasma.nix
    ./theming.nix
  ];
}
