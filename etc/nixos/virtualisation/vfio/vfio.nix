{
    config,
    lib,
    pkgs,
    ...
}: 
let
    # VFIO Configuration
    vfioIDs = "1002:73df,1002:ab28";
    vfioBlacklist = "nvidia,nvidiafb,nouveau";
in
{
    boot = {
        initrd.kernelModules = [
            "vfio_pci"
            "vfio"
            "vfio_iommu_type1"
            "amdgpu"
            # Virqfd Kernel Module Not Required for Zen Kernel
            #"vfio_virqfd"
        ];
        kernelModules = [
            "kvm-amd" 
        ];
        kernelParams = [
            "amd_iommu=on"
            "iommu=pt"
            "vfio-pci.ids=${vfioIDs}"
            "modprobe.blacklist=${vfioBlacklist}"
        ];
    };
}