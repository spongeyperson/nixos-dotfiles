# System Packages Configuration - /system/environment/packages/system-packages.nix

{
  config,
  lib,
  pkgs,
  ...
}: {
    # Allow Unstable Repo for Specific Packages: 
    nixpkgs.config = {
      packageOverrides = pkgs: with pkgs; {
        unstable = import <unstable> {};
      };
    };
    # System Font Package Config
    fonts.fonts = with pkgs; [
        nerdfonts
        powerline-fonts
        cascadia-code
    ];

    hardware.logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    #environment.shells = with pkgs; [ fish ];
    environment = {
      localBinInPath = true;
      systemPackages = with pkgs; [

        # Work Around for Logitech Mice
        logitech-udev-rules
        solaar

        linuxKernel.packages.linux_zen.v4l2loopback

        # Text Editors - CLI
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        micro
        # Text Editors - GUI
        geany

        # NixOS Specific
        nix-diff

        # Basic Commandline Tools
        wget
        fuse3
        curl

        # Archive Management
        zip
        unzip
        rar 
        unrar

        file
        htop
        btop
        tmux
        git
        man
        lshw
        lsof
        rsync
        zsync
        rclone
        ffmpeg
        ncurses5
        coreutils
        binutils
        pciutils
        usbutils
        dmidecode
        tree
        whois
        killall
        speedtest-cli
        iperf
        smartmontools
        hwloc
        mkpasswd
        gnupg # Encryption Key Management
        viddy # Watch Replacement
        # CLI - GCC MAKE Tools
        autoconf
        gcc
        gnumake
        llvm
        libclang
        clang
        cmake


        ## Hardware Control, CLI
        unstable.liquidctl     # Liquid Cooling Control
        lm_sensors    # ACPI Sensors Control
        corectrl      # AMDGPU Tuning
        ## Hardware Control, GUI
        openrgb       # RGB Control
        libratbag     # Logitech Mice
        piper         # Logitech Mice
        oversteer     # Logitech Steering Wheel


        # GPU Hardware Accel Tools / Graphics Testing
        libva-utils
        vdpauinfo
        vulkan-tools
        radeontop


        ## GUI
        fsearch
        gparted
        kdiff3
        # GUI Tools, Recording / Editing
        obs-studio
        handbrake
        sonobus
        # GUI - Remote Desktop Hosts, Etc.
        sunshine
        waynergy
        wl-clipboard
        #etcher


        ## Virtualisation, QEMU
        spice
        docker-compose


        virt-manager
        dconf
        gnome3.dconf-editor # needed for saving settings in virt-manager
        libguestfs # needed to virt-sparsify qcow2 files
        libvirt
        # Virtualisation, Distrobox
        distrobox


        ## Dependancies:
        xorg.xhost
        # fsmount, webdav
        davfs2
        autofs5
        fuse
        sshfs
        cadaver
        ## KDE Depends
        ark
        dolphin
        kate
        okular
        spectacle
        # KDE Plasma Depends, Bluetooth
        bluedevil
        bluez
        bluez-alsa
        bluez-tools
        libsForQt5.bluez-qt
        libsForQt5.bluedevil
        # GUI Tools, KDE Configuration Modules (KCM), KDE Depends
        libsForQt5.kcmutils
        libsForQt5.sddm-kcm
        libsForQt5.flatpak-kcm
        # Misc Libs for QT5, KDE Discover
        libsForQt5.discover
        packagekit
        # Tiling Window Manager
        libsForQt5.bismuth


        ## THEMING
        materia-theme
        materia-kde-theme
        # Theming, icons
        papirus-icon-theme
        # Theming, cursor
        apple-cursor
    ];
  };
}
