{
  modulesPath,
  ...
}: {
  imports = [
    #(modulesPath + "/installer/scan/not-detected.nix")
    ./bootopts
    ./bootloader
    # ./filesystem
    # ./networking
    # ./opengl
    # ./platform
    # ./processor
    # ./swapdevices
  ];
}