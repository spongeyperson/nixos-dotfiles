# Virtualisation Configuration Import - /virtualisation/default.nix

#TODO: Cleanup
{
  #commonVariables,
  ...
}: {
  imports = [
    # Define Enabled Subdirectories.
    ./vfio
    ./vmware
    #(import ./docker { inherit commonVariables; })
    #(import ./podman { inherit commonVariables; })
    #(import ./vfio { inherit commonVariables; })
  ];
}