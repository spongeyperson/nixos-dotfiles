# Boot Configuration Import - /system/boot/default.nix

 #TODO: Cleanme
{
  #commonVariables,
  ...
}: {
  imports = [
    # Define Enabled Subdirectories.
    #(import ./grub { commonVariables = commonVariables; })
    #(import ./initrd { commonVariables = commonVariables; })
    ./grub
    ./initrd
  ];
}