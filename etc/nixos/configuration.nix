# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

# Global Variables, (Optional Tunables)
  let
    hostname = "Spongey-ROG";
    timezone = "America/Los_Angeles";
    locale = "en_US.UTF-8";
    # NOTICE: VFIO has been moved to ./virtualisation/vfio/vfio.nix
  in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./hardware
      ./system
      ./packages
      ./user
      ./virtualisation
      # User Configurations
      #./userconf-configs.nix
      #./userconf-declarative.nix
      #<home-manager/nixos>
      #./system-configs.nix

      # WIP VFIO.conf
      #./vfio.nix
    ];
  
  # Set Hostname, Use Network Manager:
  networking = {
	hostName = hostname;
	networkmanager.enable = true;
  };

  # Set time zone.
  time.timeZone = timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = locale;



  # rtkit is optional but recommended
  security.rtkit.enable = true;

  # Vulkan / OpenGL (Multilib) Support /w ROCM
  hardware = {
    cpu.amd.updateMicrocode = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        # Hardware Accel
        mesa
        vaapiVdpau
        libvdpau-va-gl
        # OpenCL ROCM (Compute)
        rocm-opencl-icd
        rocm-opencl-runtime
      ];
    };
    bluetooth = {
      enable = true;
    };
  };

  # Programs Configuration:
  programs = {
    # Alternative Steam Install
    steam.enable = true;
    gamemode.enable = true;
    fish.enable = true;
    fish.shellAliases = {
      # General Aliases
      tb="nc termbin.com 9999";
      termbin="nc termbin.com 9999";
      clbin="curl -F 'clbin=<-' https://clbin.com";
      fishconfig="vim /home/tyler/.config/fish/config.fish";
      vi="vim";
      phone="scrcpy -t --bit-rate 15M --max-fps 60";
      grep="grep --color=always";
      mounts="cat /proc/mounts";
      lsmounts="cat /proc/mounts";
      #  neofetch="neofetch --config /home/tyler/.config/neofetch/fedora.conf --ascii_distro Fedora"
      virsh="virsh --connect=qemu:///system";
      update="sudo nix-channel --update ; sudo nixos-rebuild switch --upgrade";
      duf="duf -hide-fs squashfs";
      CLEAR="clear";
      onedrive="rclone serve webdav OD_Chunk:/ --vfs-cache-mode writes -P --cache-db-purge";
      ports="sudo lsof -i -P -n | grep LISTEN";
      openports="sudo lsof -i -P -n | grep LISTEN";

      #FLATPAK VSCode
      # code="flatpak run com.visualstudio.code";

      # File Management Tweaks
      mv="mv -v";
      cp="cp -v";
      ls="ls -Ch --color=always";
      l="ls -alh --color=always";
      ".."="cd ..";
      "..."="cd -";
      chmod="chmod -v";
      chown="chown -v";

      # SSH
      sshkeys="echo -e '\033[0;32mAuthorized SSH Devices:\033[0m' && ls /home/$USER/.ssh/ssh-identities/ -1I '*.pub'";
      sshkey="echo -e '\033[0;32mAuthorized SSH Devices:\033[0m' && ls /home/$USER/.ssh/ssh-identities/ -1I '*.pub'";
      keys="echo -e '\033[0;32mAuthorized SSH Devices:\033[0m' && ls /home/$USER/.ssh/ssh-identities/ -1I '*.pub'";
      key="echo -e '\033[0;32mAuthorized SSH Devices:\033[0m' && ls /home/$USER/.ssh/ssh-identities/ -1I '*.pub'";

      # Manipulate KDE
      lockwidgets="echo -e '\033[0;31mWidgets Locked\033[0m' ; qdbus org.kde.plasmashell /PlasmaShell evaluateScript 'lockCorona(true)'";
      unlockwidgets="echo -e '\033[0;32mWidgets Unlocked\033[0m' ; qdbus org.kde.plasmashell /PlasmaShell evaluateScript 'lockCorona(false)'";
      restartkwin="killall kwin_x11 ; nohup kstart5 kwin_x11 </dev/null &>/dev/null & ; echo -e '\033[0;32mKwin Restarted'";
      restartkwin_x11="killall kwin_x11 ; nohup kstart5 kwin_x11 </dev/null &>/dev/null & ; echo -e '\033[0;32mKwin (X11) Restarted'";
      restartkwin_wayland="killall kwin_wayland ; nohup kstart5 kwin_wayland </dev/null &>/dev/null & ; echo -e '\033[0;32mKwin (Wayland) Restarted'";
      restartplasma="killall plasmashell ; nohup kstart5 plasmashell </dev/null &>/dev/null & ; echo -e '\033[0;32mPlasma Shell Restarted'";
      # rebootplasma="kquitapp5 plasmashell && kstart5 plasmashell > /dev/null 2>&1";
      rebootplasma="plasmashell --replace &";
      restartdock="killall latte-dock ; nohup kstart5 latte-dock </dev/null &>/dev/null & ; echo -e '\033[0;32mLatte Dock Restarted'";

      # Manipulate System
      restartpipewire="systemctl --user restart pipewire.{socket,service} ; systemctl --user restart pipewire-pulse.{socket,service} ; echo -e '\033[0;32mPipewire Restarted'";
      restartaudio="systemctl --user restart pipewire.{socket,service} ; systemctl --user restart pipewire-pulse.{socket,service} ; echo -e '\033[0;32mPipewire Restarted'";

      # Manipulate Kraken X62 Hardware (No longer installed)
      # liquid="sudo liquidctl --match kraken set fan speed 20 30  30 40  35 45  40 55  42 58  43 75  44 80  45 90  46 92  50 100 && sudo liquidctl --match kraken set pump 100 && echo -e '\033[0;32mKraken Pump & Fan Speed Set!\033[0m'";

      # Dotfiles Sync
      config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/";
      dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/";

      # Radeon Vulkan Settings
      radv="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/radeon_icd.x86_64.json'";
      radv64="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/radeon_icd.x86_64.json'";
      radv32="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/radeon_icd.i686.json'";
      amdvlk="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/amd_icd64.json'";
      amdvlk64="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/amd_icd64.json'";
      amdvlk32="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/amd_icd32.json'";
      vulkanicd="ls /usr/share/vulkan/icd.d/*.json";
      icd="ls /usr/share/vulkan/icd.d/*.json";
      ##
    };
    kdeconnect.enable = true;
    # FIX "GTK themes are not applied in Wayland applications"
    # https://nixos.wiki/wiki/KDE#GTK_themes_are_not_applied_in_Wayland_applications
    dconf.enable = true;
    mtr = {
      # Enable Program SUID Wrapper Support.
      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      enable = true;
    };
    # Enable GNUPG Agent for Security and SSH Support.
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    # Set Tmux Default Shell to Fish
    tmux = {
      enable = true;
      extraConfig = ''
        set-option -g default-shell /run/current-system/sw/bin/fish
      '';
    };
  };

  # Fonts
  fonts.fonts = with pkgs; [
    nerdfonts
    powerline-fonts
    cascadia-code
  ];

  # Virtualisation Toggles, libvirtd, docker, podman
  virtualisation = {
  spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
      qemu.ovmf.enable = true;
      qemu.runAsRoot = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };
    docker = {
      enable = true;
      storageDriver = "btrfs";
    };
    podman = {
      enable = true;
      # Enable compat to use podman as a drop-in replacement for docker.
      #dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
