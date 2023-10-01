# System Configuration, Configuration Import - /system/config/default.nix

  #TODO: Cleanup
{
  #commonVariables,
  ...
}: {
  imports = [
    #(import ./environment/pipewire { inherit commonVariables; })
    ./locale
    ./networking
    ./nix
    ./pipewire
    ./programs
    #(import ./nix { inherit commonVariables; })
    #(import ./programs { inherit commonVariables; })
  ];
}