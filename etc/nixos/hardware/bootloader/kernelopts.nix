{
  config,
  lib,
  pkgs,
  ...
}: {
    boot = {
    # Set Zen Kernel
    kernelPackages = pkgs.linuxPackages_zen;
    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    };
    
    # NOTE: Other modules & params defined under ../../virtualisation/vfio/vfio.nix
    initrd.kernelModules = [
      "dm-snapshot" 
    ];
    kernelModules = [ ];
    kernelParams = [ ];
    extraModulePackages = [ ];
    supportedFilesystems = [ "ntfs" ];
  };
}