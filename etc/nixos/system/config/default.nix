# System Configuration, Configuration Import - /system/config/default.nix

{
  commonVariables,
  ...
}: {
  imports = [
    #(import ./environment/pipewire { inherit commonVariables; })
    (import ./nix { inherit commonVariables; })
    (import ./programs { inherit commonVariables; })
  ];
}