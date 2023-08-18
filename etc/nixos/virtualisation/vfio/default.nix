# GPU Passthrough via OVMF Config - /virtualisation/vfio/vfio.nix

{
    commonVariables,
    config,
    lib,
    pkgs,
    ...
}: {
    # Required Boot Params
    boot = {
        initrd.kernelModules = [
            "vfio_pci"
            "vfio"
            "vfio_iommu_type1"
            # Virqfd Kernel Module Not Required for Zen Kernel
            #"vfio_virqfd"
        ];
        kernelModules = [
            "kvm-amd" 
        ];
        kernelParams = [
            "amd_iommu=on"
            "iommu=pt"
            "vfio-pci.ids=${commonVariables.vfioIDs}"
            "modprobe.blacklist=${commonVariables.vfioBlacklist}"
        ];
    };

    # Enable Libvirtd, OVMF, Spice Redirection, etc.
    virtualisation = {
        spiceUSBRedirection.enable = true;
        libvirtd = {
            enable = true;
            qemu.ovmf.enable = true;
            qemu.runAsRoot = true;
            onBoot = "ignore";
            onShutdown = "shutdown";
        };
    };
}