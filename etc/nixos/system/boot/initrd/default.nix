# Initrd / Initramfs Configuration - /system/boot/initrd

{
    config,
    lib,
    pkgs,
    ...
}: {
    boot = {
    # Initramfs Settings
        initrd = {
            availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "usb_storage" "sd_mod" ];
            # NOTE: Other modules & params defined under ../../virtualisation/vfio/vfio.nix
            kernelModules = [
                "amdgpu"
                "dm-snapshot" 
            ];
        };

        # The set of kernel modules to be loaded in the second stage of the boot process.
        kernelModules = [ ];
        # Parameters added to the kernel command line.
        kernelParams = [ ];
        # A list of additional packages supplying kernel modules.
        #extraModulePackages = [ "config.boot.kernelPackages.v4l2loopback" ];
        supportedFilesystems = [ 
            "btrfs"
            "ntfs" 
        ];
    };
}