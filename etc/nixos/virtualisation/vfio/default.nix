# GPU Passthrough via OVMF Config - /virtualisation/vfio/vfio.nix

#TODO: Cleanup
{
    #commonVariables,
    config,
    lib,
    pkgs,
    ...
}: 
let
    globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
    commonVariables = globalVars.commonVariables;
in
{
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
            qemu.runAsRoot = true;
            qemu.ovmf.enable = true;
            qemu.swtpm.enable = true;
            onBoot = "ignore";
            onShutdown = "shutdown";
        };
    };

    #services = {
        #qemuGuest.enable = true; # Enable QEMU Guest Agent on Host. Disable if you're not running this in a VM
    #};
}