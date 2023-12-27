{
  config,
  lib,
  pkgs,
  ...
}:
let
  globalVars = import /etc/nixos/tunables/global-vars.nix { inherit config pkgs lib; };
  systemVariables = globalVars.systemVariables;
  userVariables = globalVars.userVariables;
in
{
    boot = {
    # Set Zen Kernel
    kernelPackages = systemVariables.kernel;
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
