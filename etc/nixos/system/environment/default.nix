# Environment Configuration Import - /system/default.nix

{
  commonVariables,
  ...
}: {
    imports = [
        # Define Enabled Subdirectories.
        (import ./packages { inherit commonVariables; })
        (import ./pipewire { inherit commonVariables; })
    ];
}