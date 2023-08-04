{
  modulesPath,
  ...
}: {
  imports = [
    #(modulesPath + "/installer/scan/not-detected.nix")
    ./bootopts.nix
    ./grub.nix
  ];
}