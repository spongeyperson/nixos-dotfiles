# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    initrd.kernelModules = [
      "dm-snapshot" 

      # VFIO
      "vfio_pci"
      "vfio"
      "vfio_iommu_type1"
      "vfio_virqfd"
    ];
    kernelModules = [
      "kvm-amd" 
    ];
    kernelParams = [
      "amd_iommu=on"
      "iommu=pt"
      "vfio-pci.ids=10de:2204,10de:1aef"
      "modprobe.blacklist=nvidia,nvidiafb,nouveau"
    ];
    extraModulePackages = [ ];
    supportedFilesystems = [ "ntfs" ];
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/ba5453e9-40c2-4c20-b4b8-8d975e07f9b7";
      fsType = "btrfs";
      options = [ "subvol=@" "ssd" "space_cache=v2" "compress=zstd" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/ba5453e9-40c2-4c20-b4b8-8d975e07f9b7";
      fsType = "btrfs";
      options = [ "subvol=@home" "ssd" "space_cache=v2" "compress=zstd" ];
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-uuid/ba5453e9-40c2-4c20-b4b8-8d975e07f9b7";
      fsType = "btrfs";
      options = [ "subvol=@var" "ssd" "space_cache=v2" "compress=zstd" ];
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

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/1E3B-DC2A";
      fsType = "vfat";
    };

  swapDevices = [ ];
  
  # CIFS Mount (Samba)
  environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/mnt/Samba/NAS" = {
      device = "//192.168.0.201/NAS";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},credentials=/etc/nixos/smb-secrets"];
  };

  # User NTFS Mounts
  fileSystems."/mnt/Old 970 Evo" =
    { device = "/dev/disk/by-uuid/01D9848E81913560";
      fsType = "ntfs-3g"; 
      options = [ "rw" "uid=1000" "gid=100" "user" "exec" "umask=000" ];
    };

  fileSystems."/mnt/New 970 Evo" =
    { device = "/dev/disk/by-uuid/2D68DA130A20AF61";
      fsType = "ntfs-3g"; 
      options = [ "rw" "uid=1000" "gid=100" "user" "exec" "umask=000" ];
    };
  
  fileSystems."/mnt/SN750 Extra Storage" =
    { device = "/dev/disk/by-uuid/4A31C0BED45DEB5F";
      fsType = "ntfs-3g"; 
      options = [ "rw" "uid=1000" "gid=100" "user" "exec" "umask=000" ];
    };

  # Temporary Mount Point for Flash Drives
  # This mount point is set as a temporary "stop-gap" for proton
  # winebottles, since i'm using NTFS Drives under Linux.
  # https://github.com/ValveSoftware/Proton/wiki/Using-a-NTFS-disk-with-Linux-and-Windows#preventing-ntfs-read-errors
  fileSystems."/media/flash" =
    { device = "/dev/disk/by-uuid/1c8497cc-4a2f-4523-890f-401109defb2e";
      fsType = "ext4";
      options = [ "defaults" "noauto" ];
    };

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
