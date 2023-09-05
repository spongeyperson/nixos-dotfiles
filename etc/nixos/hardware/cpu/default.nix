# CPU Configuration Import - /hardware/cpu/default.nix

  #TODO: Cleanme
{
  #commonVariables,
  ...
}: {
  imports = [
    # Define Enabled Subdirectories.
    ./amd
    #(import ./amd { commonVariables = commonVariables; })
  ];
}