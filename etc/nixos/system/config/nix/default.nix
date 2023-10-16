{
  modulesPath,
  ...
}: {
  imports = [
    #(modulesPath + "/installer/scan/not-detected.nix")
    ./nix.nix
  ];
}