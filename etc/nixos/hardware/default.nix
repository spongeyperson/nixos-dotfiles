# Hardware Configuration Import - /hardware/default.nix

  #TODO: Cleanme
{
  #commonVariables,
  #pkgs,
  #user,
  ...
}: {
  imports = [
    # Define Enabled Subdirectories.
    ./bluetooth
    ./cpu
    ./opengl
    # (import ./bluetooth { commonVariables = commonVariables; })
    # (import ./cpu { commonVariables = commonVariables; })
    # (import ./opengl { commonVariables = commonVariables; })
  ];
}