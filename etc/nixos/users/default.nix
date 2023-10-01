# In ./user/default.nix

  #TODO: Cleanup, Add description of this file
{
  #commonVariables,
  ...
}: {
  imports = [
    # Import User Folder + User Config
    ./tyler/tyler.nix
    #(import ./tyler/tyler.nix { commonVariables = commonVariables; })
  ];
}
