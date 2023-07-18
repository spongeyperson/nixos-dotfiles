# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
      ./user-mounts.nix
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

    #EFI System Partition
  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/1E3B-DC2A";
      fsType = "vfat";
    };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/ba5453e9-40c2-4c20-b4b8-8d975e07f9b7";
      fsType = "btrfs";
      options = [ "subvol=@" "noatime" "ssd" "space_cache=v2" "compress=zstd" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/ba5453e9-40c2-4c20-b4b8-8d975e07f9b7";
      fsType = "btrfs";
      options = [ "subvol=@home" "ssd" "space_cache=v2" "compress=zstd" ];
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-uuid/ba5453e9-40c2-4c20-b4b8-8d975e07f9b7";
      fsType = "btrfs";
      options = [ "subvol=@var" "noatime" "ssd" "space_cache=v2" "compress=zstd" ];
    };

  fileSystems."/root" =
    { device = "/dev/disk/by-uuid/ba5453e9-40c2-4c20-b4b8-8d975e07f9b7";
      fsType = "btrfs";
      options = [ "subvol=@root" "ssd" "space_cache=v2" "compress=zstd" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/ba5453e9-40c2-4c20-b4b8-8d975e07f9b7";
      fsType = "btrfs";
      options = [ "subvol=@nix" "noatime" "ssd" "space_cache=v2" "compress=zstd" ];
    };
  
  #rootvol mount
  fileSystems."/mnt/rootvol" =
    { device = "/dev/disk/by-uuid/ba5453e9-40c2-4c20-b4b8-8d975e07f9b7";
      fsType = "btrfs";
      options = [ "noatime" "ssd" "space_cache=v2" "compress=zstd" ];
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp70s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp73s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp74s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
