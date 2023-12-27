# /etc/nixos/tunables/programs/system-packages.nix

{
  config,
  lib,
  pkgs,
  ...
}: {
    # System Packages
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    #environment.shells = with pkgs; [ fish ];

    # Temporarily Permitted Insecure Packages
    nixpkgs.config.permittedInsecurePackages = [
      "nodejs-16.20.2" # Required for Webcord, according to Nix-tree
      "electron-24.8.6" # Required for Webcord
    ];


    environment = {
        localBinInPath = true;
        systemPackages = with pkgs; [

        # NixOS Specifc
        nix-tree

        # editors
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        geany
        
        # Basic Commandline Tools
        wget
        fuse3
        curl
        zip
        unzip
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
        lm_sensors
        # Encryption Key Management
        gnupg
        # Watch Replacement
        viddy
        # Hardware Accel tools, Graphics Testing
        libva-utils
        vdpauinfo
        vulkan-tools
        radeontop
        # CLI, Make Tools
        autoconf
        gcc
        gnumake
        llvm
        libclang
        clang
        cmake


        ## GUI
        openrgb
        fsearch

        # Remote Desktop Hosts, Etc.
        sunshine
        waynergy
        wl-clipboard

        # GUI Tools, General
        gparted
        kdiff3
        # GUI Tools, KDE Plasma
        ark
        dolphin
        kate
        okular
        spectacle
        # GUI Tools, KDE Plasma Depends, Bluetooth
        bluedevil
        bluez
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
        # GUI Tools, Recording / Editing
        obs-studio
        handbrake


        # Logitech Mouse Control
        libratbag
        piper
        # Logitech Steering Wheel Support
        oversteer


        #etcher
        
        # virtualisation hosts, qemu
        spice
        docker-compose
        virt-manager
        dconf
        gnome3.dconf-editor # needed for saving settings in virt-manager
        libguestfs # needed to virt-sparsify qcow2 files
        libvirt

        # Distrobox
        distrobox

        xorg.xhost

        # Filesystems
        # webdav
        davfs2
        autofs5
        fuse
        sshfs
        cadaver
        # HFS+ (MacOS)
        hfsprogs
        # Exfat
        exfat
        exfatprogs

        # THEMING
        # Theming, system
        materia-theme
        materia-kde-theme
        # Theming, icons
        papirus-icon-theme
        # Theming, cursor
        apple-cursor
        ];
    };
}
