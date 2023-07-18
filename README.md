> <p align=center> ❗ <u><b>This Repository is for my Learning Purposes</u></b> ❗ </p>
> <p align=center> This repository will <i>probably</i> never be finished. This repository was created soley for <i>my</i> learning purposes. Please don't use this for your main config setup unless you know what you're doing. <i><b>Use this Repo at your own risk</b></i></p>
<br>

# <p align=center>- Spongey's <u>NixOS</u> KDE Dotfiles -
###### <p align=center> A Simple Git Repository to store various <u>NixOS</u> Linux User Configs (Dotfiles).

- ### Index:
    - <u><b>System / Userspace Configuration</b></u>:
        - [configuration.nix](./etc/nixos/configuration.nix)
    - <u><b>Partition Configuration:</b></u>:
        - [hardware-configuration.nix](./etc/nixos/hardware-configuration.nix)


- ### Repository Todo / Related NixOS Tasks:
  - #### Actual NixOS Setup:
    - [ ] VFIO
      - [x] Setup Working `virt-manager` with `libvirt` / `qemu` backend
      - [x] Setup Backend Passthrough (e.g. Grub configs, enable `vfio-pci`, passthrough & blacklist hardware)
      - [ ] Setup a VFIO Branch or seperate optional `.nix` config file <-
    - [ ] Setup Nix Home Manager <- 
    - [ ] Setup Docker <-
    - [ ] Setup Podman <- 
    - [ ] Setup Distrobox <-
    - [ ] Setup (preferrably automated) Flatpak 
  - [ ] Implement system & user configuration file creation in [`configuration.nix`](./etc/nixos/configuration.nix)
    - [ ] Test operating system reinstallation with said configuration files, and make sure they work.
  - [ ] Make sure all configs are replicatable on Physical and Virtual Hardware
  - [ ] Remove [`changed-files/`](./changed-files/) crutch after system is replicatable elsewhere.
  - [ ] Setup `coolercontrol` as system is overheating with current lack of AIO control.

- ## Setting up / Partitioning:
    > Information in this section is based on the following NixOS Wiki Page on Manually installing on BTRFS: https://nixos.wiki/wiki/Btrfs 
    1) Create the following partitions. (via Gparted / KDE Partition Manager or <a href="https://nixos.wiki/wiki/Btrfs#Installation">Manually Via Commandline</a>)
        - Layout:

    2) Mount New Bare Partition & cd to it:
        > Replace "device" with your device name. You can find your device name via running: `lsblk -f` 
        ```
        sudo mount /dev/<device> /mnt
        ```
        ```
        cd /mnt
        ```
    3) Create Subvolumes for Install:
        ```
        sudo btrfs subvol create @
        sudo btrfs subvol create @home
        sudo btrfs subvol create @root
        sudo btrfs subvol create @var
        sudo btrfs subvol create @nix
        ```
    4) cd elsewhere, then Unmount Bare Partition:
        ```
        cd ~
        ```

        ```
        sudo umount -Rv /mnt
        ```

    5) Mount Subvolume Partitions:
        > Replace "device" with your device name. You can find your device name via running: `lsblk -f` 

        ```
        sudo mount -o subvol=@,compress=zstd,noatime /dev/<device> /mnt
        ```
    - Then create recursive partitions:
        > dumb linux quirks...
        ```
        sudo mkdir -pv /mnt/{home,root,var,nix,boot/efi}
        ```
    - Continue to mount the rest of the partitions:
        ```
        sudo mount -o subvol=@home,compress=zstd /dev/<device> /mnt/home
        sudo mount -o subvol=@root,compress=zstd /dev/<device> /mnt/root
        sudo mount -o subvol=@var,compress=zstd,noatime /dev/<device> /mnt/var
        sudo mount -o subvol=@nix,compress=zstd,noatime /dev/<device> /mnt/nix
        ``` 
    - Mount EFI System Partition (EFI + GPT Only)
        ```
        sudo mount /dev/<device> /mnt/boot/efi
        ```
    6) Sanity Check:
        - Run the following command to check your partitions:
          ```
          cat /proc/mounts | grep -e btrfs -e vfat
          ```
        - You should see something similar to this:
        <img src="https://github.com/spongeyperson/nixos-dotfiles/assets/28176188/95de4518-393f-4fe0-8a85-7f5ae4acf5b5" title="Your layout should look similar to this, if done correctly.'--color=always' was just enabled to show you the different disk types and make it easier to read.">

- ## Installing NixOS:
    1) Generate Config + Fstab
        ```
        sudo nixos-generate-config --root /mnt
        ```
    2) Optional Tunables:
        - In `hardare-configuration.nix`, add `./user-mounts.nix` for user mounts. You may have to configure this file to your needs, as obviously your extra drives will not be avaliable here.
        - You may also want to change the following line in `configuration.nix`
          ```nix
          networking = {
            hostName = "Spongey-PC";
          }
          ```
          to whatever is required. Obviously, if you don't set this, your pc will be called `Spongey-PC` by default.
<!--
<p align=center><img src="https://user-images.githubusercontent.com/28176188/210040764-90bf0b89-1e4f-4f6f-aa42-35a006060849.png" title="I Run Arch Btw"></p>

<h2>Index:</h2>
<ul>
  <li><b>This Repo</b>:</li>
  <ul>
    <li><a href="#cloning-this-repo">Cloning this Repo</a></li>
    <li><b><u>Branches:</u></b></li>
      <ul>
        <li><a href="https://github.com/spongeyperson/arch-dotfiles/tree/unused">Unused files Branch</a></li>
      </ul>   
      <li><b><u>Configurations</u></b>:</li>
        <ul>
          <li><a href="https://github.com/spongeyperson/arch-dotfiles/tree/master/etc/X11/xorg.conf.d/">Xorg configuration</a></li>
          <li><a href="https://github.com/spongeyperson/arch-dotfiles/tree/master/home/tyler/.local/share/plasma/layout-templates">Custom KDE panels</a></li>
          <li><b><u>VFIO / GPU Passthrough Related</u></b>:</li>
            <ul>
              <li><a href="https://github.com/spongeyperson/arch-dotfiles/tree/master/usr/share/kvm">GPU VBIOS ROMs</a></li>
              <li><a href="https://github.com/spongeyperson/arch-dotfiles/tree/master/etc/libvirt/qemu">Virsh Config XMLs</a></li>
            </ul>
          </ul>
        </ul>
      </ul>
    </ul>
  </ul>
</ul>
<li><b>Other Repos</b>:</li>
  <ul>
  <li><b>Extra Dotfiles, Belonging to this Repo:</b> <a href="https://github.com/spongeyperson/dotfiles-extras"><sup><code>../dotfiles-extras</code></sup></a></li>
    <ul>
      <li><b><u>Documentation:</u></b></li>
      <ul>
        <li><a href="https://github.com/spongeyperson/dotfiles-extras/blob/master/docs/PRIME-Render-Settings.md">(WIP) Prime Render Offload Settings:</a></li>
        <li><img src="https://user-images.githubusercontent.com/28176188/224575749-b843d685-2e1e-43bc-8267-ee337fde8206.svg" width="14" height="14"><b> <u>Wine Related:</b></u></li>
        <ul>
          <li><a href="https://github.com/spongeyperson/dotfiles-extras/blob/master/docs/Game-Settings.md">Game settings<a></li>
          <li><a href="https://github.com/spongeyperson/dotfiles-extras/blob/master/docs/Game-Troubleshooting.md">Game troubleshooting<a></li>
        </ul>
        <li><b><u>Hardware Specific Fixes & Settings:</u></b></li>
          <ul>
            <li><a href="https://github.com/spongeyperson/dotfiles-extras/blob/master/docs/Hardware%20Specific%20Fixes%20%26%20Settings/Steam%20Deck%20Settings.md">Steam Deck</a></li>
            <li><a href="https://github.com/spongeyperson/dotfiles-extras/blob/master/docs/Hardware%20Specific%20Fixes%20%26%20Settings/ROG-G15-config.md">ROG G15 AMD Advantage on Linux</a></li>
            <li><a href="https://github.com/spongeyperson/dotfiles-extras/blob/master/docs/Hardware%20Specific%20Fixes%20%26%20Settings/ZENITH-II-Extreme-config.md">(WIP) TRX40 Zenith II Extreme on Linux</a></li>
          </ul>
      </ul>
      <li><b><u>Configurations</u></b>:</li>
        <ul>
          <li><a href="https://github.com/spongeyperson/dotfiles-extras/tree/master/virshxml_examples">Virsh Config XML Examples</a></li>
        </ul>
    </ul>
  </ul>
</ul>
<ul>
  <li><b>Other Dotfiles</b>:</li>
    <ul>
      <li><b>Fedora (ROG G15)</b>: <a href="https://github.com/spongeyperson/fedora-dotfiles-laptop/">spongeyperson/fedora-dotfiles-laptop</a></li>
      <li><b>Fedora</b>: <a href="https://github.com/spongeyperson/fedora-dotfiles/">spongeyperson/fedora-dotfiles</a></li>
      <li><b>Proxmox</b>: <a href="https://github.com/spongeyperson/proxmox-config/">spongeyperson/proxmox-config</a></li>
    </ul>
  </ul>
</ul>

## Cloning this Repo:
> Please note, this information was taken from the following source and changed to fit the content of this repo.
> https://www.atlassian.com/git/tutorials/dotfiles


### From Scratch:

  1) <b>Initialize the Repo:</b>
      ```bash
      git init --bare $HOME/.dotfiles
      ```
  2) <b>Set an Alias in your Shell's Config:</b>
      > Fish Shell:
      ```bash
      echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/'" >> $HOME/.config/fish/config.fish
      ```
      > Bash Shell:
      ```bash
      echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/'" >> $HOME/.bashrc
      ```
  3) <b>Globally Untrack Files that aren't part of the Dotfiles</b>
      ```bash
      dotfiles config --local status.showUntrackedFiles no
      ```

### Migrate / Merge into System:

  1) <b>Set an Alias in your Shell's Config:</b>
      > Fish Shell:
      ```bash
      echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/'" >> $HOME/.config/fish/config.fish
      ```
      > Bash Shell:
      ```bash
      echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/'" >> $HOME/.bashrc
      ```
  2) <b>Globally Untrack Files that aren't part of the Dotfiles</b>
      ```bash
      dotfiles config --local status.showUntrackedFiles no
      ```
  3) <b>Set Dotfiles Repo Source as ignored:</b>
      ```bash
      echo ".dotfiles" >> .gitignore
      ```
  4) <b>Clone Bare Repo:</b>
      ```bash
      git clone --bare https://github.com/spongeyperson/arch-dotfiles.git $HOME/.dotfiles/
      ```
  5) <b>Checkout Content from Remote Repo:</b>
      ```bash
      dotfiles checkout
      ```
-->

---
###### <p align=center> Note: I do <ins>not</ins> pretend to own any content on this git repository. All contents are copyright of their respective owners. This repository is intented for recreating Linux installs only. Content on this repository is installed <ins>at your own risk</ins>. If you have any legal issue with the content on this repository, please make a github issue and i will create a submodule linking to your project instead.</p>
