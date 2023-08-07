{
  modulesPath,
  ...
}: {
  imports = [
    #(modulesPath + "/installer/scan/not-detected.nix")
    ./bootloader
    # ./filesystem
    # ./networking
    # ./opengl
    # ./platform
    # ./processor
    # ./swapdevices
  ];
}