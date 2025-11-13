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
    globalVars = import (toString ../global-vars.nix) { inherit config pkgs lib; };
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
            #"kvmfr" # KVMFR for Project Looking Glass
        ];
        # KVMFR Static Framebuffer Size for Project Looking Glass
        # extraModprobeConfig = ''
        #     options kvmfr static_size_mb=64
        # '';
        kernelParams = [
            #"pci=msi" - No longer in kernel? 
            "msi=on"
            "amd_iommu=on"
            "iommu=pt"
            "vfio_iommu_type1.allow_unsafe_interrupts=1"
            "kvm.ignore_msrs=1"
            "vfio-pci.ids=${systemVariables.vfioIDs}"
            "modprobe.blacklist=${systemVariables.vfioBlacklist}"
        ];
    };

    # Enable Libvirtd, OVMF, Spice Redirection, etc.
    virtualisation = {
        #qemu.package = "pkgs.qemu_full"; - Broken
        spiceUSBRedirection.enable = true;
        libvirtd = {
            enable = true;
            #qemu.package = "pkgs.qemu_full";
            qemu.runAsRoot = true;
            qemu.ovmf.enable = true;
            qemu.swtpm.enable = true;
            onBoot = "ignore";
            onShutdown = "shutdown";
        };
    };

    # Enable Virt-Manager
    programs = {
        virt-manager.enable = true;
    };

    environment.systemPackages = with pkgs; [
        # Install KVMFR Kernel Module
        #linuxKernel.packages.${systemVariables.kernelmodule_support}.kvmfr #Disabled, because of Build Errors
        looking-glass-client


        ## Virtualisation, QEMU
        qemu_full
        quickemu
        quickgui
        spice
        #virt-manager
        dconf
        dconf-editor # needed for saving settings in virt-manager
        libguestfs # needed to virt-sparsify qcow2 files
        libvirt
        # Virtualisation, Distrobox
        distrobox

        ## Dependancies:
        xorg.xhost
    ];

    
    ## Non-working Profile
    # networking.networkmanager.ensureProfiles = {
    #     profiles = {
    #         # Define the bridge profile
    #         br0 = {
    #             connection.type = "bridge";
    #             connection.id = "br0";
    #             ipv4.method = "auto"; # or use "manual" and specify an IP for static addressing
    #             ipv6.method = "ignore"; # set according to your needs
    #         };

    #         # Define the physical interface enp70s0 as a slave to the bridge
    #         enp70s0 = {
    #             connection.type = "ethernet";
    #             connection.id = "enp70s0";
    #             connection.slave-type = "bridge";
    #             connection.master = "br0";
    #         };
    #     };
    # };
    #services = {
        #qemuGuest.enable = true; # Enable QEMU Guest Agent on Host. Disable if you're not running this in a VM
    #};
}