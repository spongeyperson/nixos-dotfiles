# /etc/nixos/system/boot/default.nix

{
  ...
}: {
  imports = [
    # File Declarations
    ./grub.nix
    ./initrd.nix
    ./kernelparams.nix
  ];
}