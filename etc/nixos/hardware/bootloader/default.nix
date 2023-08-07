{
  modulesPath,
  ...
}: {
  imports = [
    #(modulesPath + "/installer/scan/not-detected.nix")
    ./kernelopts.nix
    ./grub.nix
  ];
}