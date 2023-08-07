{
  modulesPath,
  ...
}: {
  imports = [
    #(modulesPath + "/installer/scan/not-detected.nix")
    ./services.nix
    ./udev-rules.nix
  ];
}