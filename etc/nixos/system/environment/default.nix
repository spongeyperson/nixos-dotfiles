# Environment Configuration Import - /system/default.nix

  #TODO: Cleanup
{
  #commonVariables,
  ...
}: {
    imports = [
        # Define Enabled Subdirectories.
        ./packages/system-packages.nix
        #(import ./packages { inherit commonVariables; })
        #(import ./pipewire { inherit commonVariables; })
    ];
}