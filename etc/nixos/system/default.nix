# System Configuration Import - /system/default.nix

{
  commonVariables,
  ...
}: {
  imports = [
    # Define Enabled Subdirectories.
    (import ./boot { inherit commonVariables; })
    (import ./config { inherit commonVariables; })
    (import ./packages { inherit commonVariables; })
    (import ./services { inherit commonVariables; })
  ];
}