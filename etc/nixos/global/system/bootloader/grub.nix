# /etc/nixos/global/system/bootloader/grub.nix
{
    config,
    lib,
    pkgs,
    ...
}: {
    boot = {
        loader = {
            efi = {
                canTouchEfiVariables = true;
                efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
            };
            grub = {
                # Enable Grub
                enable = true;
                # EFI Support Enable
                efiSupport = true;
                #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
                device = "nodev";
                #useOSProber = true;
            };
        };
    };
}
