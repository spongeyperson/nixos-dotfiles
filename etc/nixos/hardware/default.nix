{
  modulesPath,
  ...
}: {
  imports = [
    #(modulesPath + "/installer/scan/not-detected.nix")
    # Define Enabled Subdirectories.
    ./bluetooth
    ./cpu
    ./opengl
  ];
}