> <p align=center> ❗ <u><b>This Repository is for my Learning Purposes</u></b> ❗ </p>
> <p align=center> This repository will <i>probably</i> never be finished. This repository was created soley for <i>my</i> learning purposes. Please don't use this for your main config setup unless you know what you're doing. <i><b>Use this Repo at your own risk</b></i></p>
<br>

# <p align=center>- Spongey's <u>NixOS</u> KDE Dotfiles -
###### <p align=center> A Simple Git Repository to store various <u>NixOS</u> Linux User Configs (Dotfiles).

<p align=center><img src="https://github.com/spongeyperson/nixos-dotfiles/assets/28176188/753412df-980b-49d3-83ae-fa5af3bcc6ad" title="I Run Nix Btw"></p>

- ## Index:
    - <u><b>System / Userspace Configuration</b></u>:
        - [configuration.nix](./etc/nixos/configuration.nix)
    - <u><b>Partition Configuration:</b></u>:
        - [hardware-configuration.nix](./etc/nixos/hardware-configuration.nix)

- ### Repository Todo / Related NixOS Tasks:
  - #### Actual NixOS Setup:
    - [X] VFIO
      - [x] Setup Working `virt-manager` with `libvirt` / `qemu` backend
      - [x] Setup Backend Passthrough (e.g. Grub configs, enable `vfio-pci`, passthrough & blacklist hardware)
      - [X] Setup a VFIO Branch or seperate optional `.nix` config file <-~~
    - [ ] Setup Nix Home Manager
    - [x] Setup `Flatpak`
      - [ ] Make `Flatpak` Declarative.
    - [x] Setup `Docker`
    - [X] Setup `Podman`
    - [X] Setup `Distrobox`
  - [ ] Implement system & user configuration file creation in [`configuration.nix`](etc/nixos/configuration.nix)
    - [ ] Test operating system reinstallation with said configuration files, and make sure they work.
  - [x] Make sure all configs are replicatable on Physical and Virtual Hardware
  - [x] Remove [`changed-files/`](nixos-dotfiles/changed-files/) crutch after system is replicatable elsewhere.
  - [ ] Setup `coolercontrol` as system is overheating with current lack of AIO control.

- ## Setting up / Partitioning:
    > Information in this section is based on the following NixOS Wiki Page on Manually installing on BTRFS: https://nixos.wiki/wiki/Btrfs 
    1) #### Create a BTRFS Partition you want to install to; Find it's /dev/<device> name
        - I suggest you use Gparted. This will be automated in the future.

    2) #### Mount New Bare Partition & cd to it:
        > Replace "device" with your device name. You can find your device name via running: `lsblk -f` 
        ```
        sudo mount /dev/<device> /mnt
        ```
        ```
        cd /mnt
        ```
    3) #### Create Subvolumes for Install:
        > This is a Multi-line Command:
        ```
        sudo btrfs subvol create @; \ 
        sudo btrfs subvol create @home; \
        sudo btrfs subvol create @root; \
        sudo btrfs subvol create @var; \
        sudo btrfs subvol create @nix
        ```
    4) #### cd elsewhere, then Unmount Bare Partition:
        ```
        cd ~
        ```

        ```
        sudo umount -Rv /mnt
        ```

    5) #### Mount Subvolume Partitions:
        > Replace "`<device>`" with your device name (e.g: nvme0n1p1). You can find your device name via running: `lsblk -f`. 

        ```
        sudo mount -o subvol=@,compress=zstd:3,noatime /dev/<device> /mnt
        ```
    - Then create recursive partitions:
        > dumb linux quirks...
        ```
        sudo mkdir -pv /mnt/{home,root,var,nix,boot/efi}
        ```
    - Continue to mount the rest of the partitions:
        > Replace "`<device>`" with your device name (e.g: nvme0n1p1). You can find your device name via running: `lsblk -f`. <u>This is a multi-line command</u> which will mount all your partitions when you replace the first line with the correct device. 
        ```
        DEVICE=<device>; \
        sudo mount -o subvol=@home,compress=zstd:3 /dev/$DEVICE /mnt/home; \
        sudo mount -o subvol=@root,compress=zstd:3 /dev/$DEVICE /mnt/root; \
        sudo mount -o subvol=@var,compress=zstd:3,noatime /dev/$DEVICE /mnt/var; \
        sudo mount -o subvol=@nix,compress=zstd:3,noatime /dev/$DEVICE /mnt/nix
        ``` 
    - Mount EFI System Partition (EFI + GPT Only)
        ```
        sudo mount /dev/<device> /mnt/boot/efi
        ```
    6) #### Sanity Check:
        - Run the following command to check your partitions:
          ```
          cat /proc/mounts | grep -e btrfs -e vfat --color=always
          ```
        - You should see something similar to this:
        <img src="https://github.com/spongeyperson/nixos-dotfiles/assets/28176188/95de4518-393f-4fe0-8a85-7f5ae4acf5b5" title="Your layout should look similar to this, if done correctly.'--color=always' was just enabled to show you the different disk types and make it easier to read.">

- ## Installing NixOS:
    1) #### Generate Config + Fstab
        ```sh
        sudo nixos-generate-config --root /mnt
        ```
        <u>This command generates the following 2 files:</u><br>
        `configuration.nix` - Global NixOS Configuration File<br>
        `hardware-configuration.nix` - Hardware Specific Configuration File<br>
    2) #### Overwrite `configuration.nix` with the one in this repository:
        > The previous command re-generated an automatic `configuration.nix`
        - The Nix LiveCD (as of writing this) doesn't include `wget`. Install it.
        ```sh
        sudo nix-env -iA nixos.wget
        ```
        then grab the file:
        ```sh
        cd /mnt/etc/nixos/
        ```
        ```sh
        wget https://github.com/spongeyperson/nixos-dotfiles/blob/desktop/etc/nixos/configuration.nix
        ```
    3) #### Verify your `hardware-configuration.nix` & set the following mount options:
        - The previous command generated a `hardware-configuration.nix`, which is similar to your Operating Systems' `fstab` file.
        
        > Here's my recommended mount options:

        > **Warning**: `/home` & `/root` <i>should not</i> have the `"noatime"` mount option.
        ```
        fileSystems."/" =
          { device = "/dev/disk/by-uuid/<device-uuid>";
            fsType = "btrfs";
            options = [ "subvol=@" "noatime" "ssd" "space_cache=v2" "compress=zstd:3" ];
          };

        fileSystems."/home" =
          { device = "/dev/disk/by-uuid/<device-uuid>";
            fsType = "btrfs";
            options = [ "subvol=@home" "ssd" "space_cache=v2" "compress=zstd:3" ];
          };

        fileSystems."/root" =
          { device = "/dev/disk/by-uuid/<device-uuid>";
            fsType = "btrfs";
            options = [ "subvol=@root" "ssd" "space_cache=v2" "compress=zstd:3" ];
          };

        fileSystems."/var" =
          { device = "/dev/disk/by-uuid/<device-uuid>";
            fsType = "btrfs";
            options = [ "subvol=@var" "noatime" "ssd" "space_cache=v2" "compress=zstd:3" ];
          };

        fileSystems."/nix" =
          { device = "/dev/disk/by-uuid/<device-uuid>";
            fsType = "btrfs";
            options = [ "subvol=@nix" "noatime" "ssd" "space_cache=v2" "compress=zstd:3" ];
          };
        ```
    - Optional Tunables:
        - In [`hardware-configuration.nix`](etc/nixos/hardware-configuration.nix), <!-- Uncommented, as not sure what the context for this was: add `./user-mounts.nix` for user mounts.--> You may have to configure this file to your needs, as obviously your extra drives will not be avaliable here.
        - You may also want to change the following line(s) in [`global-vars.nix`](etc/nixos/global-vars.nix) near the beginning of the file.
          ```nix
          systemVariables = {
            ...

            vfioIDs = "10de:2204,10de:1aef";
            vfioBlacklist = "nvidia,nvidiafb,nouveau";

            # System Hostname
            hostname = "Spongey-PC";
            # Fully Qualified (Local) Domain Name
            fqdn = "Spongey-PC.lan";
          };
          userVariables = {
            ...
            # User
            username = "tyler";
            usershell = pkgs.fish;
            userid = 1000;

            # Locale / Localisation
            timeZone = "America/Los_Angeles"; # Set time zone.
            locale = "en_US.UTF-8"; # Select internationalisation properties.
            keymap = "us";
          };
          ```
  4) #### Finish by Installing NixOS to `/mnt`:
      - ```nix
        sudo nixos-install --root /mnt
        ```
  #### <center>Congratz, It's installed. (if you did it right)</center>

---
###### <p align=center> Note: I do <ins>not</ins> pretend to own any content on this git repository. All contents are copyright of their respective owners. This repository is intented for recreating Linux installs only. Content on this repository is installed <ins>at your own risk</ins>. If you have any legal issue with the content on this repository, please make a github issue and i will create a submodule linking to your project instead.</p>
