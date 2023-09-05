# System Configuration Import - /system/default.nix

  #TODO: Cleanup
{
  #commonVariables,
  ...
}: {
  imports = [
    # Define Enabled Subdirectories.
    ./boot
    ./config
    ./environment
    ./services
    #(import ./boot { commonVariables = commonVariables; })
    # (import ./config/default.nix { commonVariables = commonVariables; })
    # (import ./environment/default.nix { commonVariables = commonVariables; })
    # (import ./services/default.nix { commonVariables = commonVariables; })
  ];
}