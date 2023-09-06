# System Configuration Import - /system/default.nix

{
  ...
}: {
  imports = [
    # Define Enabled Subdirectories.
    ./boot
    ./config
    ./environment
    ./services
  ];
}