# Boot Configuration Import - /system/boot/default.nix

{
  commonVariables,
  ...
}: {
  imports = [
    # Define Enabled Subdirectories.
    (import ./grub { inherit commonVariables; })
    (import ./initrd { inherit commonVariables; })
  ];
}