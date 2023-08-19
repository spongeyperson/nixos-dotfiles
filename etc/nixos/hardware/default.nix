# Hardware Configuration Import - /hardware/default.nix

{
  commonVariables,
  ...
}: {
  imports = [
    # Define Enabled Subdirectories.
    (import ./bluetooth { inherit commonVariables; })
    (import ./cpu { inherit commonVariables; })
    (import ./opengl { inherit commonVariables; })
  ];
}