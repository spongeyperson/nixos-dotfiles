# This Configuration File is a bridge file that links the following imports together.
# Modify this configuration only if you want to EXCLUDE a specific config.

{
  commonVariables,
  ...
}: {
  imports = [
    #(modulesPath + "/installer/scan/not-detected.nix")
    (import ./system-packages.nix { inherit commonVariables; })
  ];
}