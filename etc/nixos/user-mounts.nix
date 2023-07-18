{ config, lib, pkgs, modulesPath, ... }:

{
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
}