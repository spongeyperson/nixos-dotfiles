# /etc/nixos/virtualisation/vfio.nix
# GPU Passthrough via OVMF Config

{
    config,
    lib,
    pkgs,
    ...
}: 
# Import global-vars.nix
let
    globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
    systemVariables = globalVars.systemVariables;
    userVariables = globalVars.userVariables;
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
            #"vfio-pci.ids=${systemVariables.vfioIDs}" - Disabled due to wanting hybrid approach to handling dGPU binding
            "modprobe.blacklist=${systemVariables.vfioBlacklist}"
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
