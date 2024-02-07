# /etc/nixos/system/boot/initrd.nix
# Initrd / Initramfs Configuration

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
            # TODO: make "amdgpu" declaration connect to global-vars.nix
            kernelModules = [
                "amdgpu"
                "dm-snapshot" 
            ];
        };

        # A list of additional packages supplying kernel modules.
        #extraModulePackages = [ "config.boot.kernelPackages.v4l2loopback" ];
        supportedFilesystems = [ 
            "btrfs"
            "ntfs" 
        ];
    };
}