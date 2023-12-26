{
    config,
    lib,
    pkgs,
    ...
}: 
let
  globalVars = import /etc/nixos/tunables/global-vars.nix { inherit config pkgs lib; };
  systemVariables = globalVars.systemVariables;
  commonVariables = globalVars.commonVariables;
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
            "${systemVariables.cputype}_iommu=on"
            "iommu=pt"
            "vfio-pci.ids=${systemVariables.vfioIDs}"
            "modprobe.blacklist=${systemVariables.vfioBlacklist}"
        ];
    };
}
