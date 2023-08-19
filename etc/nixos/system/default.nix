# System Configuration Import - /system/default.nix

{
  commonVariables,
  ...
}: {
  imports = [
    # Define Enabled Subdirectories.
    (import ./boot { inherit commonVariables; })
    (import ./config { inherit commonVariables; })
    (import ./environment { inherit commonVariables; })
    (import ./services { inherit commonVariables; })
  ];
}