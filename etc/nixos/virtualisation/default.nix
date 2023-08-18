# Virtualisation Configuration Import - /virtualisation/default.nix

{
  commonVariables,
  ...
}: {
  imports = [
    # Define Enabled Subdirectories.
    #(import ./docker { inherit commonVariables; })
    #(import ./podman { inherit commonVariables; })
    (import ./vfio { inherit commonVariables; })
  ];
}