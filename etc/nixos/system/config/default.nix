# System Configuration, Configuration Import - /system/config/default.nix

  #TODO: Cleanup
{
  #commonVariables,
  ...
}: {
  imports = [
    #(import ./environment/pipewire { inherit commonVariables; })
    ./nix
    ./programs
    #(import ./nix { inherit commonVariables; })
    #(import ./programs { inherit commonVariables; })
  ];
}