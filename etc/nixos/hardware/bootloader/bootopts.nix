{
  config,
  lib,
  pkgs,
  ...
}: 

let
    # VFIO Configuration
    vfioIDs = "10de:2204,10de:1aef";
    vfioBlacklist = "nvidia,nvidiafb,nouveau";
in

{
    boot = {
    # Set Zen Kernel
    kernelPackages = pkgs.linuxPackages_zen;
    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    };
    
    initrd.kernelModules = [
      "dm-snapshot" 

      # VFIO
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
      "vfio-pci.ids=${vfioIDs}"
      "modprobe.blacklist=${vfioBlacklist}"
    ];
    extraModulePackages = [ ];
    supportedFilesystems = [ "ntfs" ];
  };
}